require 'spec_helper'

describe UserPomodoros do
  
  it "assigns a user given a valid user id" do
    user = create(:user)
    expect(UserPomodoros.new(user).user).to eq(user)
  end

  it "assigns a guest user when no id given" do
    expect(UserPomodoros.new.user).to be_an_instance_of(GuestUser)
  end
  
  it "adds a pomodoro for a user given a tag" do
    user = create(:user)
    response = UserPomodoros.new(user).add_pomodoro('test')
    expect(user.pomodoros.count).to eq(1)
    expect(response).to be_an_instance_of(Pomodoro)
  end

  it "does not save a pomodoro when times overlap" do
    user = create(:user)
    interface = UserPomodoros.new(user)
    interface.add_pomodoro('test')
    second_request = interface.add_pomodoro('test')
    expect(user.pomodoros.count).to eq(1)
    expect(second_request).to eq("Pomodoros must be #{user.work_time} minutes apart")
  end

end
