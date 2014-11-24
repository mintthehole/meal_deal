class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :check_time, if: :current_user

  def check_time
    if current_user.present?
      if Timing.last.present?
        allow = false
        current_time = Time.zone.now
        timings = Timing.all
        timings.each do |timing|
          if current_time.hour >= timing.start_time.hour && current_time.hour <= timing.end_time.hour
            allow = true
            break
          end
        end
        
        timings_str = []
        timings.each do |time|
          timings_str << "#{time.start_time.hour} : #{time.start_time.min}  -  #{time.end_time.hour}  : #{time.end_time.min}"
        end
        unless allow
          @time_limit_exceeded = true
          flash.now[:notice] = "Orders Can't be Processed now. Come Back in these timings #{timings_str.join(',')}"
          false
        end
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