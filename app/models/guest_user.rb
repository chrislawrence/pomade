class GuestUser
  def initialize
    @id = 1
    @work_time = 25 
    @break_time = 5
    @long_break_time = 15
  end
  def as_json(options={})
    { 'user' => {:id => @id , :work_time => @work_time, :break_time => @break_time, :long_break_time => @long_break_time}}
  end

  def work_time
    @work_time
  end

  def break_time
    @break_time
  end

  def to_partial_path
    "users/guest_header"
  end

  def method_missing(*args, &block)
        self
          end
end
