require 'spec_helper'

describe UserStats do
 describe "Pomodoros present" do
   before do
    user = create(:user)
    user.pomodoros << Pomodoro.new(:end_time => 2.months.ago)
    50.times do
      user.pomodoros << Pomodoro.new
    end
    @stats = UserStats.new(user)
  end

  it "gets today's pomodoros" do
    expect(@stats.today).to eq(50)
  end


  it "gets Pomodoros in the last month" do
    expect(@stats.this_month).to eq(50)
  end

  it "calculates the average pomodoros per day" do
    expect(@stats.average).to eq(1)
  end
  it "calculates the total this year" do
    expect(@stats.this_year).to eq(51)
  end
 end

 describe "No pomodoros present" do
   before do
    @stats = UserStats.new(build(:user))
   end

   it "gets today's pomodoros" do
     expect(@stats.today).to eq(0)
   end

   it "gets pomodoros in last month" do
     expect(@stats.this_month).to eq(0)
   end

   it "gets pomodoros in this year" do
     expect(@stats.this_year).to eq(0)
   end

   it "gets the average daily count" do
     expect(@stats.average).to eq(0)
   end
 end
end
