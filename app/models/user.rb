class User < ActiveRecord::Base
  include Preferences
  has_many :pomodoros
  has_secure_password

  preference :work_time, 25
end
