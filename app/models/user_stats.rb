class UserStats
  class NoPomodoros
    def method_missing(*args, &block)
      self
    end
    def to_s
      return '0'
    end
  end

  NoAverage = Class.new
  def initialize(user)
    @pomodoros = user.pomodoros
    @pomodoros = NoPomodoros.new if @pomodoros.count == 0
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
    if !@pomodoros.count.to_f.nan?
      days = days_since @pomodoros.first.start_time
      average = (@pomodoros.count.to_f / days.to_f).round(0)
    else
      average = 0
    end
    average
  end
  
  private

  def days_since(date)
    days = (Date.today - date.to_date).to_i
    days + 1
  end
end
