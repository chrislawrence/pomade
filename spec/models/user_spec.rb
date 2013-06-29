require 'spec_helper'

describe User do
  it 'generates a token on save' do
    user = create(:user)
    expect(user.auth_token).to_not be_nil
  end

  it 'adds a pomodoro with the users default times' do
    user = create(:user, :work_time => 10)
    user.add_pomodoro('working')
    pomodoro = user.pomodoros.first
    expect(pomodoro.end_time - pomodoro.start_time).to eq(user.work_time.minutes)
  end
  it "adds a pomodoro in the past" do
  end 
  it "only allows letters and numbers in username" do
    user = create(:user, :username => 'bigboi10')
    User.count.should eq(1)
 end
  it "returns a hash of tags" do
    user = create(:user)
    user.add_pomodoro('study')
    user.add_pomodoro('working')
    expect(user.tags).to eq([["working", 1], ["study", 1]])
  end

  it "returns a hash of pomodoros by day" do
    user = create(:user)
    user.add_pomodoro('study')
    user.add_pomodoro('study')
    expect(user.by_day).to eq({"day": "#{Date.today}", "count": 2})
  end
end
