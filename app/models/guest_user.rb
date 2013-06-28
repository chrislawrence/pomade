class GuestUser
  def initialize
    @id = 1
    @work_time = 25 
    @break_time = 5
  end
  def as_json(options={})
    { 'user' => {:id => @id , :work_time => @work_time, :break_time => @break_time}}
  end
  def header
  end

  def method_missing(*args, &block)
        self
          end
end
