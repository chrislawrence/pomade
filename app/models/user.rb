class User < ActiveRecord::Base
  has_secure_password validations: false
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
