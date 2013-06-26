class Pomodoro < ActiveRecord::Base
  belongs_to :user
  
  before_save :set_times
  WORKING_TIME = 25.minutes

  def set_times
    self.end_time ||= Time.now
    self.start_time ||= self.end_time - WORKING_TIME
  end

  def self.new_for_user(tag,work_time,end_time)
  Pomodoro.new(:end_time => end_time, :start_time => end_time - work_time.minutes, :tag => tag)
  end
end
