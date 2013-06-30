class UserMailer < ActionMailer::Base
  default from: "c@pomade.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset reset
    @reset = reset
    
    mail to: reset.email, subject: "Password reset on pomade.io"
  end
end
