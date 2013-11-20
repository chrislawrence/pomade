class Pomodoro < ActiveRecord::Base
  belongs_to :user
  validates :start_time, :end_time, :overlap => true
  before_validation :complete_times
  
  def length
    user.present? ? user.preference.work_time.to_i : 25
  end

  private

  def complete_times 
    self.end_time ||= start_time + length.minutes
    self.start_time ||= end_time - length.minutes
  end

end
