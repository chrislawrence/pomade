require 'spec_helper'

describe 'Pomodoros API' do
  
    it 'returns all pomodoros' do
      Pomodoro.create
      get 'api/pomodoros.json' 
      expect(response.status).to eq(200)
    end

    it 'returns a specified pomodoro' do
      pomodoro = Pomodoro.create
      get "api/pomodoros/#{pomodoro.id}.json"
      expect(response.status).to eq(200)
    end

    it 'creates a pomodoro with valid params' do
      post "api/pomodoros.json", pomodoro: {end_time: Time.now}
      expect(response.status).to eq(201)
    end

    it 'creates a pomodoro with invalid params' do
      post "api/pomodoros.json", pomodoro: {end_time: 1.day.from_now}
      expect(response.status).to eq(422)
      expect(response.body).to include('errors')
    end

    it 'updates a pomodorow with valid params' do
      pomodoro = Pomodoro.create
      put "api/pomodoros/#{pomodoro.id}.json", pomodoro: {end_time: Time.zone.now}
      expect(response.status).to eq(200)
    end

    it 'updates a pomodoro with invalid params' do
      pomodoro = Pomodoro.create
      put "api/pomodoros/#{pomodoro.id}.json", pomodoro: {end_time: 1.day.from_now}
      expect(response.status).to eq(422)
      expect(response.body).to include('errors')
    end

end
