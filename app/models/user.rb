class User < ActiveRecord::Base
  has_many :pomodoros
  has_secure_password

  preference :work_time, :integer, :default => 25
end
