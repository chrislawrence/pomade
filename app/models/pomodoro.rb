class Pomodoro < ActiveRecord::Base
  belongs_to :user
  validates :start_time, :end_time, :overlap => true
  before_validation :complete_times
  
  def length
    user.present? ? user.preferred(:work_time).to_i : 25
  end

  private
    
  def check_time_given
    if !self.start_time and !self.end_time
      false
    else
      true
    end
  end

  def complete_times 
    if check_time_given
      self.end_time ||= start_time + length.minutes
      self.start_time ||= end_time - length.minutes
    else
      errors.add(:start_time, "At least one time must be supplied")
    end
  end

end
