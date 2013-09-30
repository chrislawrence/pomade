require 'spec_helper'

describe UserStats do
 describe "Pomodoros present" do
   before do
    user = create(:user)
    user.pomodoros << Pomodoro.new(:end_time => 2.months.ago, tag: 'test')
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
  
  it "gets the most productive day" do
   expect(@stats.best_day).to eq(Date.today.strftime("%a"))
  end

  it "gets the most in one day" do
    expect(@stats.most_in_one).to include(Date.today)
  end

  it "gets the most productive time of day" do
    expect(@stats.most_productive_time).to eq("morning")
  end

  it "gets the tags" do
    expect(@stats.tags).to include({:label => "test", :"value" => 1})
  end

 end

end
