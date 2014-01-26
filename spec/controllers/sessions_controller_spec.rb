require 'spec_helper'

describe Api::SessionsController do
  context 'correct parameters' do
    it "returns ID and token when logging in" do
      user = create(:user)
      post :create, email: user.email, password: user.password
      token = JSON.parse(response.body)['auth_token']
      expect(token).to eq(user.token)
    end
  end

  context 'incorrect parameters' do
    it 'returns a 401 error when logging in' do
      post :create, username: 'fake', password: 'fake'
      response.status.should be(400)
    end
  end
end
