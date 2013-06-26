class Pomodoro < ActiveRecord::Base
  before_save :set_times
  WORKING_TIME = 25.minutes

  def set_times
    self.start_time ||= Time.now
    self.end_time ||= self.start_time - WORKING_TIME
  end
end
