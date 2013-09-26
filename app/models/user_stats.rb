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

  
  def day
    best_day = @pomodoros.pluck("extract(DOW FROM start_time)").group_by(&:to_i).values.max_by(&:size).first
    parse_day(best_day)
  end

  def best_day
    @pomodoros.unscoped.select("date(start_time)").group("date(start_time)").count.first
  end

  # For fun only :)

  def average_no_rounding
    days = days_since @pomodoros.last.start_time
    (@pomodoros.count.to_f / days.to_f)
  end



  private

  def days_since(date)
    days = (Date.today - date.to_date).to_i
    days + 1
  end

  def parse_day(day)
    case day
    when 1
      'Mon'
    when 2 
      'Tue'
    when 3
      'Wed'
    when 4
      'Thu'
    when 5
      'Fri'
    when 6
      'Sat'
    when 7
      'Sun'
    end
  end

end
