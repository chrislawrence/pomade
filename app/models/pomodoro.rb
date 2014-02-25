class Pomodoro < ActiveRecord::Base
  before_validation :generate_times
  validate :no_future

  private

  def generate_times
    if !end_time && !start_time
      self.end_time = Time.zone.now
    end
    if !start_time
      self.start_time = self.end_time - 25.minutes
    elsif !end_time
      self.end_time = self.start_time + 25.minutes
    end
  end

  def no_future
    if self.end_time > Time.zone.now
      errors.add(:end_time, "may not be in the future")
    end
  end
end
