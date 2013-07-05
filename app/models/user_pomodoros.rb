class UserPomodoros
  include ActiveModel::Model
  attr_reader :user

  def initialize(user = GuestUser.new)
    @user = user 
    @work_time = @user.work_time
  end

  def add_pomodoro(tag)
    if @user.latest_pomodoro.end_time < Time.now - @work_time
      pomodoro = Pomodoro.new_for_user(@work_time, Time.now, tag )
      @user.pomodoros << pomodoro
      pomodoro
    else
      "Pomodoros must be #{@work_time} minutes apart"
    end
  end
end
