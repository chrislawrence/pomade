class UserStats

  def self.get_user(user)
    if user.pomodoros.count > 0
      UserStats.new(user)
    else
      NoUserStats.new
    end
  end

  def initialize(user)
    @pomodoros = user.pomodoros
    @start_times = @pomodoros.pluck(:start_time)
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
    last = @pomodoros.last
    days = days_since last.start_time
    (@pomodoros.count.to_f / days.to_f).round(0)
  end
  
  def best_day
    day = @pomodoros.pluck("extract(DOW FROM start_time)").group_by(&:to_i).values.max_by(&:size)
    parse_day(day.first)
  end

  def most_in_one
    days = []
    @start_times.each do |t| days << t.to_date end
    freq = days.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.max_by{|k,v|v}
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
      "<i class='icon-sunrise'></i><div class='icon-desc'>Morning</div>"
    elsif max == afternoon
      "<i class='icon-sunset'></i><div class='icon-desc'>Afternoon</div>"
    else 
      "<i class='icon-moon'></i><div class='icon-desc'>Night</div>"
    end
  end


  def tags
    tags = @pomodoros.pluck(:tag).reject{|t| t == nil}.map(&:downcase).map(&:strip)
    tag_counts = Hash.new(0)
    tags.each do |tag|
      tag_counts[tag] += 1
    end
    # Get into format that morris likes
    tag_array = []
    tag_counts.each do |count|
      tag_array.push(:label => count[0], :value => count[1])
    end
    tag_array
  end
  
  def by_day
    (1.weeks.ago.to_date..Date.today).map do |date|
    {
      label: date, 
      count: @pomodoros.where("start_time BETWEEN ? AND ? ", date.beginning_of_day, date.end_of_day).count
    }
    end
  end

  def average_no_rounding
    days = days_since @pomodoros.last.start_time
    (@pomodoros.count.to_f / days.to_f)
  end



  private

  def days_since(date)
    days = (Date.today - date.to_date).to_i
    days + 1
  end

  def first_day(date)
    true if date.day == 1 || date == 1.weeks.ago.to_date
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
