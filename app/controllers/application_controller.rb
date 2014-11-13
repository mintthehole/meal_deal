class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :check_time, if: :current_user

  def check_time
    if Timing.last.present?
      time_1 = Time.zone.now
      time_2 = Timing.last.end_time
      conv1 = Time.at(time_1.hour * 60 * 60 + time_1.min * 60 + time_1.sec)
      conv2 = Time.at(time_2.hour * 60 * 60 + time_2.min * 60 + time_2.sec)
      if conv1 > conv2
        @time_limit_exceeded = true
        flash.now[:notice] = "You cannot order beyond #{time_2.strftime("%H:%M:%S")}"
        false
      end
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:phone_no, :building_id, :email, :password, :password_confirmation)}
  end
end