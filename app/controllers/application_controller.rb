class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :authenticate_admin_user!, if: :admin_namespace?

  private

  def admin_namespace?
    request.fullpath.start_with?('/admin')
  end

  def initialize_cart
    session[:cart] ||= {}
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      Rails.logger.info "AdminUser signed in: #{resource.email}"
      admin_root_path
    else
      products_path
    end
  end
end
