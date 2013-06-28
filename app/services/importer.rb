class Importer
 require 'csv' 
  def initialize(user)
    @user = user
  end

  def import(file)
    CSV.foreach(file.path) do |row|
      parse_row(row)
    end
  end

  def parse_row(row)
    @user.pomodoros << Pomodoro.new_for_user(@user.work_time,row[0].to_datetime,row[1])
  end

end
