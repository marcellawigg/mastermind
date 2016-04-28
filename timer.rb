class Timer
  attr_reader :start_time, :end_time

  def start_time
    @start_time = Time.now
  end

  def end_time
    @end_time = Time.now
  end

  def total_time
    (@end_time - @start_time).round
  end

  def minutes
    (total_time / 60).round
  end

  def seconds
    (total_time % 60).round
  end

end
