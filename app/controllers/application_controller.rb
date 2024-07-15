# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_admin_user!, if: :admin_namespace?

  private

  def admin_namespace?
    request.fullpath.start_with?('/admin')
  end

  def after_sign_in_path_for(resource)
    Rails.logger.info "AdminUser signed in: #{resource.email}"
    super
  end
  def after_sign_in_path_for(resource)
    products_path # or any other path
  end
end
