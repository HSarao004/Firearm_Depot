class UserInfosController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user_info = current_user.user_info || current_user.build_user_info
  end

  def update
    @user_info = current_user.user_info || current_user.build_user_info
    if @user_info.update(user_info_params)
      redirect_to root_path, notice: 'User info was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_info_params
    params.require(:user_info).permit(:street, :city, :province, :postal_code, :card_number, :card_expiry, :card_cvv)
  end
end
