class PasswordReset < ActiveRecord::Base
  validate :existing_user
  after_validation :generate_token
  after_create :email_user

  def self.reset_password email, token, new_password
   reset = PasswordReset.where(:email => email, :token => token).first 
    if reset 
      user = User.where(:email => email).first
      user.update_attribute(:password_and_confirmation, new_password)
      reset.destroy
    end
  end

  private

  def email_user
    UserMailer.password_reset(self).deliver
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def existing_user
    errors.add(:email, "Email does not exist") if !User.where(:email => self.email).first
  end
  
 end
