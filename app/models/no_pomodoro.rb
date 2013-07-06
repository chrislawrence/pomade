class NoPomodoro
  
  def method_missing(*args, &block)
   self 
  end

  def destroy
    nil
  end

  def end_time
    Time.new(0)
  end
  
  def to_s
    0
  end
  
  def to_i
    0
  end
  def to_date
   Date.today
  end
end
