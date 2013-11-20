require 'spec_helper'

describe Api::SessionsController do
  context 'correct parameters' do
    it "returns ID and token when logging in" do
      user = create(:user)
      post :create, user: {email: user.email, password: user.password }
      response.status.should be(201)
    end
  end

  context 'incorrect parameters' do
    it 'returns a 401 error when logging  in' do
      post :create, user: {email: 'fake', password: 'fake'}
      response.status.should be(401)
    end
  end
end
