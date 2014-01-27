require 'spec_helper'

describe Api::UserPomodorosController do
  it 'gets todays pomodoros for the user' do
    user = create(:user)
    Pomodoro.create(end_time: Time.now)
    user.pomodoros << [
      Pomodoro.new(end_time: 36.hours.ago), 
      Pomodoro.new(end_time: Time.now)]
    user.save
    get :index, auth_token: user.token
    expect(response.body).to include(user.pomodoros.today.to_json)
  end

  it 'returns null if no current user' do
    get :index
    Pomodoro.create(end_time: Time.now)
    expect(response.body).to eq(" ")
  end
end
