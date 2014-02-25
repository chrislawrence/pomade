require 'spec_helper'

describe Pomodoro do
  it 'generates a start time when only end time is given' do
    pomodoro = Pomodoro.create(end_time: Time.zone.now)
    expect(pomodoro.start_time).to be_within(10.seconds).of(25.minutes.ago)
  end

  it 'generates an end time when only start time is given' do
    pomodoro = Pomodoro.create(start_time: 30.minutes.ago)
    expect(pomodoro.end_time).to be_within(10.seconds).of(5.minutes.ago)
  end

  it 'defaults to now when no times given' do
    pomodoro = Pomodoro.create
    expect(pomodoro.end_time).to be_within(10.seconds).of(Time.zone.now)
  end

end
