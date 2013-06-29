require 'spec_helper'

describe PomodorosController do
  it "returns a list of today's pomodoros when a user is logged in" do
    user = create(:user)
    3.times do
      user.pomodoros << Pomodoro.create(:tag => 'working')
    end
    request.cookies[:auth_token] = user.auth_token
    get :index, :format => :json
    expect(response.body).to_not eq(" ") # this test stinks.
  end

  it "returns default values if user not logged in" do
    get :index, :format => :json
    expect(response.body).to eq("{\"user\":{\"id\":1,\"work_time\":25,\"break_time\":5,\"long_break_time\":15}}")
  end

  it "creates a pomodoro when user logged in" do
    user = create(:user)
    request.cookies[:auth_token] = user.auth_token
    post :create, :pomodoro => { :tag => 'working' }, :format => :json
    expect(user.pomodoros.count).to eq(1)
  end
  
  it "does not create a pomodoro when user not logged in" do
    post :create, :pomodoro => {:tag => 'working'}, :format => :json
    expect(Pomodoro.count).to eq(0)
  end
end
