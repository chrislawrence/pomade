class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros
  before_save :generate_auth_token
  
 def add_pomodoro(tag)
   pomodoro = Pomodoro.new_for_user(tag, self.work_time,Time.now)
   self.pomodoros << pomodoro
 end
  
  private

  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
  
end
