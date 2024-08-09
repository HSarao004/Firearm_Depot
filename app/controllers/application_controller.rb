class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Devise methods for normal users
  def authenticate_user!
    if admin_user_signed_in?
      authenticate_admin_user!
    else
      super
    end
  end

  def current_user
    if admin_user_signed_in?
      current_admin_user
    else
      super
    end
  end

  def user_signed_in?
    admin_user_signed_in? || super
  end

  # Methods for admin users
  def authenticate_admin_user!
    return if admin_user_signed_in?

    redirect_to new_admin_user_session_path
  end

  def current_admin_user
    @current_admin_user ||= warden.authenticate(scope: :admin_user)
  end

  def admin_user_signed_in?
    current_admin_user.present?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
