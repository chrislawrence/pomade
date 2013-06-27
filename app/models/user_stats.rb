class UserStats
  def initialize(user)
    @pomodoros = user.pomodoros
  end

  def last_month
    @pomodoros.where("start_time > ?", 1.month.ago)
  end

  def average
    days = days_since @pomodoros.first.start_time
    @pomodoros.count / days
  end
  
  private

  def days_since(date)
    (Date.today - date.to_date).to_i
  end
end
