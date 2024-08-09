class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  def create
    ActiveRecord::Base.transaction do
      if params[:order][:user_info].present?
        @user_info = current_user.user_info || current_user.build_user_info(user_info_params)
        @user_info.update!(user_info_params)
      else
        @user_info = current_user.user_info
      end

      @order = current_user.orders.create!(order_params.merge(tax_id: Tax.find_by(region: @user_info.province).id))

      session[:cart].each do |product_id, quantity|
        @order.order_items.create!(product_id:, quantity:)
      end

      if params[:stripeToken].present?
        Rails.logger.info "Stripe token received: #{params[:stripeToken]}"
        @order.update!(status: "paid", stripe_payment_id: params[:stripeToken])
        Rails.logger.info "Order status set to 'paid' for order ID: #{@order.id} with status #{@order.status}"
        session[:cart] = {}
        redirect_to orders_path, notice: "Order completed successfully!"
      else
        Rails.logger.info "Stripe token not received"
        raise ActiveRecord::Rollback, "Payment failed"
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = e.message
    redirect_to checkout_cart_path
  end

  private

  def user_info_params
    params.require(:order).require(:user_info).permit(:street, :city, :province, :postal_code)
  end

  def order_params
    total_price = session[:cart].sum do |product_id, quantity|
      Product.find(product_id).price * quantity
    end
    province = user_info_params[:province] || current_user.user_info.province
    tax = Tax.find_by(region: province)
    gst = total_price * (tax.gst_rate / 100)
    pst = total_price * (tax.pst_rate / 100)
    hst = total_price * (tax.hst_rate / 100)

    {
      total_price:,
      gst:,
      pst:,
      hst:,
      total_with_tax: total_price + gst + pst + hst
    }
  end
end
