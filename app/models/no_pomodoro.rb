class NoPomodoro
  def method_missing? (*args, &block)
    self 
  end
  def destroy
    nil
  end
  def end_time
    Time.new(0)
  end
end
