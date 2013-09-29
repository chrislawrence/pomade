class UserStats

  NoAverage = Class.new
  
  def initialize(user)
    @pomodoros = user.pomodoros
  end

  def today
    @pomodoros.where("start_time >= ?", Time.zone.today.beginning_of_day).count
  end

  def this_month
    @pomodoros.where("start_time >= ?", Time.zone.today.beginning_of_month).count
  end

  def this_year
    @pomodoros.where("start_time >= ?", Time.zone.today.beginning_of_year).count
  end

  def average
    last = @pomodoros.last || NoPomodoro.new
    days = days_since last.start_time
    (@pomodoros.count.to_f / days.to_f).round(0)
  end
  
  def best_day
    day = @pomodoros.pluck("extract(DOW FROM start_time)").group_by(&:to_i).values.max_by(&:size).first
    parse_day(day)
  end

  def most_in_one
    @pomodoros.unscoped.order("date(start_time)").group("date(start_time)").count
  end

  def most_productive_time
    times = @pomodoros.pluck("extract(HOUR FROM start_time)")
    morning, afternoon, night = 0, 0, 0
    times.each do |time|
      if 4 < time  && time < 12
        morning += 1
      elsif 11 < time && time < 18
        afternoon += 1
      else
        night += 1
      end
    end
    max = [morning, afternoon, night].max
    if max == morning
      "morning"
    elsif max == afternoon
      "afternoon"
    else 
      "night"
    end
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
    when 0
      'Sun'
    end
  end

end
