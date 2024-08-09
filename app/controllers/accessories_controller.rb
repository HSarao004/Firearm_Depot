class AccessoriesController < ApplicationController
  before_action :set_accessory, only: %i[show add_to_cart]

  def index
    @q = Accessory.ransack(params[:q])
    @accessories = @q.result.includes(:category)
  end

  def show; end

  def add_to_cart
    cart_item = current_user.carts.find_or_initialize_by(cartable: @accessory)
    cart_item.quantity ||= 0
    cart_item.quantity += params[:quantity].to_i
    if cart_item.save
      flash[:notice] = "Accessory added to cart"
    else
      flash[:alert] = "Failed to add accessory to cart"
    end
    redirect_to accessory_path(@accessory)
  end

  private

  def set_accessory
    @accessory = Accessory.find(params[:id])
  end
end
