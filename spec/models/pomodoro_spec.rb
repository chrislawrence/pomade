require 'spec_helper'

describe Pomodoro do
  before do
    @time = DateTime.new(2001,01,01,0,0,0)
  end

  it 'sets the start and end times when not specified' do
    pomodoro = Pomodoro.create(:tag => 'working')
    Pomodoro.first.start_time.should be_within(1.minute).of(DateTime.now)
  end

  it 'does not override provided start_time' do
    pomodoro = Pomodoro.create(:tag => 'working', :start_time => @time)
    expect(pomodoro.start_time).to eq(@time)
  end

  it 'automatically sets an end time when given a start time' do
    pomodoro = Pomodoro.create(:tag => 'working', :start_time => @time)
    expect(pomodoro.end_time).to eq(@time - 25.minutes)
  end

end
