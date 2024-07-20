class UserInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_info

  def edit
    @provinces = Tax.pluck(:region)
  end

  def update
    if @user_info.update(user_info_params)
      redirect_to root_path, notice: 'User info updated successfully.'
    else
      @provinces = Tax.pluck(:region)
      render :edit
    end
  end

  private

  def set_user_info
    @user_info = current_user.user_info || current_user.build_user_info
  end

  def user_info_params
    params.require(:user_info).permit(:street, :city, :province, :postal_code, :card_number, :expiry, :cvv)
  end
end
