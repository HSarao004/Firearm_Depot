class AccessoriesController < ApplicationController
  def index
    @q = Accessory.ransack(params[:q])
    @accessories = @q.result.includes(:category)
  end

  def show
    @accessory = Accessory.find(params[:id])
  end
end
