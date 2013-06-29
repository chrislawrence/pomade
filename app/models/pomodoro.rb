class Pomodoro < ActiveRecord::Base
  belongs_to :user
  scope :today, -> { where("start_time > ?", Date.today).order(:start_time)}
  default_scope order(:start_time)
  before_save :set_times
  WORKING_TIME = 25.minutes

  def set_times
    self.end_time ||= Time.now
    self.start_time ||= self.end_time - WORKING_TIME
  end

  def self.new_for_user(work_time,end_time,tag)
  Pomodoro.new(:end_time => end_time, :start_time => end_time - work_time.minutes, :tag => tag)
  end
end
