class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :update_allowed_parameters, if: :devise_controller?

  # prevent users to perform action without authentication
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
