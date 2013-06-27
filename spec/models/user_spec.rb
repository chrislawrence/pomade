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

end
