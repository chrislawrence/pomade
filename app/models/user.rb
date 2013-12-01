class User < ActiveRecord::Base
  has_many :pomodoros
  has_secure_password
  before_save :generate_token

  preference :work_time, :integer, :default => 25
  
  private

  def generate_token
    self.token = SecureRandom.hex
  end
end
