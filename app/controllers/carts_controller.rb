class CartsController < ApplicationController
  before_action :initialize_cart

  def show
  end

  def add
    product = Product.find(params[:product_id])
    @cart[product.id.to_s] = (@cart[product.id.to_s] || 0) + 1
    save_cart
    redirect_to cart_path, notice: 'Product added to cart.'
  end

  def update_quantity
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    if quantity > 0
      @cart[product_id] = quantity
    else
      @cart.delete(product_id)
    end
    save_cart
    redirect_to cart_path, notice: 'Cart updated.'
  end

  def remove_item
    @cart.delete(params[:product_id])
    save_cart
    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  def checkout
    @user_info = current_user.user_info || UserInfo.new
    @provinces = Tax.pluck(:region)
  end

  def complete_order
    logger.debug "Params: #{params.inspect}"

    ActiveRecord::Base.transaction do
      if params[:order][:user_info].present?
        @user_info = current_user.user_info || current_user.build_user_info(user_info_params)
        @user_info.update!(user_info_params)
      else
        @user_info = current_user.user_info
      end

      order = current_user.orders.create!(order_params.merge(tax_id: Tax.find_by(region: @user_info.province).id))

      session[:cart].each do |product_id, quantity|
        order.order_items.create!(product_id: product_id, quantity: quantity)
      end

      session[:cart] = {}
    end
    redirect_to orders_path, notice: 'Order completed successfully!'
  rescue ActiveRecord::RecordInvalid => e
    logger.debug "Order creation failed: #{e.message}"
    @provinces = Tax.pluck(:region)
    render :checkout
  rescue ActionController::ParameterMissing => e
    flash[:alert] = "Missing parameter: #{e.param}"
    redirect_to checkout_cart_path
  end

  private

  def initialize_cart
    @cart = session[:cart] || {}
  end

  def save_cart
    session[:cart] = @cart
  end

  def user_info_params
    params.require(:order).require(:user_info).permit(:street, :city, :province, :postal_code)
  end

  def order_params
    total_price = session[:cart].sum { |product_id, quantity| Product.find(product_id).price * quantity }
    province = user_info_params[:province] || current_user.user_info.province
    tax = Tax.find_by(region: province)
    gst = total_price * (tax.gst_rate / 100)
    pst = total_price * (tax.pst_rate / 100)
    hst = total_price * (tax.hst_rate / 100)

    {
      total_price: total_price,
      gst: gst,
      pst: pst,
      hst: hst,
      total_with_tax: total_price + gst + pst + hst,
      tax_id: tax.id
    }
  end
end
