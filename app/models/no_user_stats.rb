class NoUserStats

  def method_missing(*args, &block)
    0 
  end

  def best_day
    "<span class='no-stats'>No stats yet</span>"
  end

  def most_productive_time
    "<span class='no-stats'>No stats yet</span>"
  end

end
