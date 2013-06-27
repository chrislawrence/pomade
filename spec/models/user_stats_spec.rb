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

 it "gets today's pomodoros" do
   expect(@stats.today).to eq(500)
 end


 it "gets Pomodoros in the last month" do
   expect(@stats.this_month).to eq(500)
 end

 it "calculates the average pomodoros per day" do
   expect(@stats.average).to eq(8)
 end
 it "calculates the total this year" do
   expect(@stats.this_year).to eq(501)
 end
end
