class UserInfosController < ApplicationController
  before_action :set_user_info, only: [:edit, :update]
  before_action :set_provinces, only: [:edit, :update]

  def edit
  end

  def update
    if @user_info.update(user_info_params)
      redirect_to root_path, notice: 'User information updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_user_info
    @user_info = current_user.user_info
  end

  def set_provinces
    @provinces = Tax.pluck(:region)
  end

  def user_info_params
    params.require(:user_info).permit(:street, :city, :province, :postal_code)
  end
end
