class UserStats

  NoAverage = Class.new
  
  def initialize(user)
    @pomodoros = user.pomodoros
  end

  def today
    @pomodoros.where("start_time >= ?", Date.today.beginning_of_day).count
  end

  def this_month
    @pomodoros.where("start_time >= ?", Date.today.beginning_of_month).count
  end

  def this_year
    @pomodoros.where("start_time >= ?", Date.today.beginning_of_year).count
  end

  def average
    last = @pomodoros.last || NoPomodoro.new
    days = days_since last.start_time
    (@pomodoros.count.to_f / days.to_f).round(0)
  end
  
  private

  def days_since(date)
    days = (Date.today - date.to_date).to_i
    days + 1
  end
end
