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
    days = days_since @pomodoros.first.start_time
    average = @pomodoros.count.to_f / days.to_f
    average.nan? ? NoAverage : average.round(0)
  end
  
  private

  def days_since(date)
    days = (Date.today - date.to_date).to_i
    days = 1 if days == 0
    days
  end
end
