require 'spec_helper'

describe Pomodoro do
  before do
    @time = DateTime.new(2001,01,01,0,0,0)
  end

  it 'sets the start and end times when not specified' do
    pomodoro = Pomodoro.create(:tag => 'working')
    Pomodoro.first.end_time.should be_within(1.minute).of(DateTime.now)
  end

  it 'does not override provided end_time' do
    pomodoro = Pomodoro.create(:tag => 'working', :end_time => @time)
    expect(pomodoro.end_time).to eq(@time)
  end

  it 'automatically sets a start time when given an end time' do
    pomodoro = Pomodoro.create(:tag => 'working', :end_time => @time)
    expect(pomodoro.start_time).to eq(@time - 25.minutes)
  end
  
  describe "tags" do
  before :each do
  @user = build(:user) 
  @user.pomodoros << [Pomodoro.new(:tag => 'test'),
                Pomodoro.new(:tag => 'test'),
                Pomodoro.new(:tag => 'work'),
                Pomodoro.new(:tag => '')]
  end
  it 'returns a hash of counts for tags' do
  expect(Pomodoro.by_tag(@user.pomodoros)).to include(["test",2])  
  end

  it "does not include blank tags" do
    expect(Pomodoro.by_tag(@user.pomodoros)).to_not include("")   
end
end
end
