class ModelMailer < ActionMailer::Base
  default from: "Curry Pots <currypots85@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.oder_notification.subject
  #
  def oder_notification(order)
    @greeting = "Hi"
    @order = order
    mail to: @order.user.email, :subject => "Your Order Confirmation"
  end
end
