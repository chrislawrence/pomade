class User < ActiveRecord::Base
  has_secure_password validations: false
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  before_save :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex
  end
end
