require 'spec_helper'

describe 'User API' do
  it 'returns all users' do
    user = create(:user)
    get '/api/users.json'
    expect(response.status).to eq(200)
    expect(response.body).to include(user.to_json)
  end

  it 'returns a specified user' do
    user = create(:user)
    get "/api/users/#{user.id}.json"
    expect(response.status).to eq(200)
    expect(response.body).to include(user.to_json)
  end

  it 'creates a new user with valid params' do
    post '/api/users.json', user: {email: 'chris@test.com', password: 'abc', password_confirmation: 'abc'}
    expect(response.status).to eq(201)
  end

  it 'creates a new user with invalid params' do
    post '/api/users.json', user: {email: 'chris@test.com'}
    expect(response.status).to eq(422)
  end

  it 'updates a user with valid params' do
    user = create(:user)
    put "/api/users/#{user.id}.json", user: {email: 'c@test.com'}
    expect(response.status).to eq(200)
  end

  it 'updates a user with invalid params' do
    user = create(:user)
    put "/api/users/#{user.id}.json", user: {password: 'password', password_confirmation: 'wrong'}
    expect(response.status).to eq(422)
    expect(response.body).to include('errors')
  end
end
