class NoPomodoro
  def method_missing? (*args, &block)
    self 
  end
  def destroy
    nil
  end
end
