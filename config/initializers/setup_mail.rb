ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name  => "currypots85@gmail.com",
  :password  => "Jonathan!987",
  :authentication  => :plain,
  :enable_starttls_auto => true
}