require 'spec_helper'

describe 'pomodoro' do
  it 'sets the end_time given a start_time' do
    pomodoro = Pomodoro.create(start_time: Time.zone.now)
    expect(pomodoro.end_time).to be_within(5.seconds).of(Time.zone.now + 25.minutes)
  end

  it 'sets the start_time given an end_time' do
    pomodoro = Pomodoro.create(end_time: Time.zone.now)
    expect(pomodoro.start_time).to be_within(5).of(Time.zone.now - 25.minutes)
  end

  it 'sets a custom pomodoro length given the user' do
    pomodoro = Pomodoro.new(start_time: Time.zone.now)
    pomodoro.stub_chain(:user, :work_time).and_return(10)
    pomodoro.save
    expect(pomodoro.end_time).to be_within(5.seconds).of(Time.zone.now + 10.minutes)
  end
  
  it 'does not allow pomodoros that overlap' do
    first = Pomodoro.create(start_time: Time.zone.now)
    second = Pomodoro.new(start_time: Time.zone.now)
    expect(second).to_not be_valid
  end
end
