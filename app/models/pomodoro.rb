class Pomodoro < ActiveRecord::Base
  WORKING_TIME = 25
  
  def self.create_by_tag(tag)
    pomodoro = Pomodoro.new(:tag => tag)
    pomodoro.start_time = Time.now
    pomodoro.end_time = pomodoro.start_time - WORKING_TIME
    pomodoro.save
  end
end
