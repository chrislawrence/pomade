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
  
  describe "Destroying pomodoros" do
    before do
      @user = create(:user)
      @worker = UserPomodoros.new(@user)
      @user_pomodoro = Pomodoro.new
      @user.pomodoros << @user_pomodoro
      @anon_pomodoro = Pomodoro.create
    end

    it "destroys a pomodoro belonging to the user" do
      expect{@worker.delete_pomodoro(@user_pomodoro.id)}.to change{Pomodoro.count}.by(-1)
    end

    it "does not destroy a pomodoro not belonging to the user" do
      expect{@worker.delete_pomodoro(@anon_pomodoro.id)}.to change{Pomodoro.count}.by(0)
    end
  end
end
