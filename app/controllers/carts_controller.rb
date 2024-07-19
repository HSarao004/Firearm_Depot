class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart_items = current_user.carts.includes(:cartable)
  end

  def update_quantity
    cart_item = current_user.carts.find(params[:id])
    quantity = params[:quantity].to_i
    if quantity > 0
      cart_item.update(quantity: quantity)
      flash[:notice] = 'Cart updated'
    else
      flash[:alert] = 'Invalid quantity'
    end
    redirect_to cart_path
  end

  def remove_item
    cart_item = current_user.carts.find(params[:id])
    cart_item.destroy
    flash[:notice] = 'Item removed from cart'
    redirect_to cart_path
  end

  private

  def initialize_cart
    @cart = current_user.carts.includes(:cartable)
  end
end
