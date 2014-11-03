class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_sanitized_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:phone_no, :building_id, :email, :password, :password_confirmation)}
  end
end