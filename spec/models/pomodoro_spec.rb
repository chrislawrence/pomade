require 'spec_helper'

describe Pomodoro do
  it 'sets the start and end times when not specified' do
    pomodoro = Pomodoro.create_by_tag('working')
    Pomodoro.first.start_time.should be(< 1.hour.ago)
  end
end