class NoUserStats

  def method_missing(*args, &block)
    0 
  end

  def best_day
    "No stats yet"
  end

  def most_productive_time
    "No stats yet"
  end

end
