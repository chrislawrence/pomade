class Pomodoro < ActiveRecord::Base
  before_save :set_times
  WORKING_TIME = 25.minutes

  def set_times
    self.end_time ||= Time.now
    self.start_time ||= self.end_time - WORKING_TIME
  end
end
