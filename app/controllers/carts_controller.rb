class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product) if @cart
  end

  def update_quantity
    @cart = current_user.cart
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update(quantity: params[:quantity])
      redirect_to cart_path, notice: 'Quantity updated.'
    else
      redirect_to cart_path, alert: 'Unable to update quantity.'
    end
  end

  def remove_item
    @cart = current_user.cart
    Rails.logger.debug("Params ID: #{params[:id]}")
    @cart_item = @cart.cart_items.find_by(id: params[:id])

    if @cart_item
      @cart_item.destroy
      redirect_to cart_path, notice: 'Item removed from cart.'
    else
      redirect_to cart_path, alert: 'Item not found.'
    end
  end

end
