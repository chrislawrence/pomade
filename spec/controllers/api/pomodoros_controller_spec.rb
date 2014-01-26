require 'spec_helper'

describe Api::PomodorosController do
  before do
    @pomodoro = {end_time: Time.now, tag: 'working'}
  end
  context 'user not logged in' do
    it 'returns the pomodoro' do
      post :create, pomodoro: @pomodoro
      expect(response.status).to eq(200)
    end
    it 'does not save a pomodoro' do
      expect{
        post :create, pomodoro: @pomodoro
      }.to_not change{Pomodoro.count}
    end
  end

  context 'user logged in' do
    before do
      @user = create(:user)
    end

    it 'returns the pomodoro' do
      post :create, { pomodoro: @pomodoro, auth_token: @user.token }
      expect(response.status).to eq(200)
    end

    it 'saves the pomodoro' do
      post :create, { pomodoro: @pomodoro, auth_token: @user.token }
      expect(@user.pomodoros.count).to eq(1)
    end
  end
end
