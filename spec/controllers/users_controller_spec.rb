require 'spec_helper'

describe UsersController do
  it "gets the current user" do
    user = create(:user)
    request.cookies[:auth_token] = user.auth_token
    get 'me'
    expect(response.body).to include("user")   
  end
  it "returns a guest user when not logged in" do
    get 'me'
    expect(response.body).to include("user")
  end
end
