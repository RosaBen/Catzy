class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_devise_parameters, if: :devise_controller?

def configure_devise_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation) }
end
end
