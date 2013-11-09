class User < ActiveRecord::Base
  include Preferences
  has_many :pomodoros

  preference :work_time, 25
end
