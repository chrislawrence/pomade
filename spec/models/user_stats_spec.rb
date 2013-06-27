require 'spec_helper'

describe UserStats do
 before do
   user = create(:user)
   user.pomodoros << Pomodoro.new(:end_time => 2.months.ago)
   500.times do
     user.pomodoros << Pomodoro.new
   end
   @stats = UserStats.new(user)
 end

 it "gets Pomodoros in the last month" do
   expect(@stats.last_month.count).to eq(500)
 end

 it "calculates the average pomodoros per day" do
   puts @stats.average
   expect(@stats.average).to eq(8)
 end
end
