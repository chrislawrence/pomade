require 'spec_helper'

describe UserSerializer do
  it "returns the current user in a JSON array" do
    user = create(:user)
    request.cookies[:auth_token] = user.auth_token
    get 'users#me'
  end
end
