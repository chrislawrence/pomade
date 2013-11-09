class Pomodoro < ActiveRecord::Base
  belongs_to :user
  validates :start_time, :end_time, :overlap => true
end
