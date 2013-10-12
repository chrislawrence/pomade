require 'spec_helper'

describe SessionsController do
  before do
    @user = create(:user)
  end

  it "logs in with the user" do
    get :create, user: {email:  @user.email, password: @user.password}
    expect(response).to redirect_to '/'
    expect(response.cookies['auth_token']).to eq(@user.auth_token)
  end

  it "sets a permanent cookie" do
    post :create, user: {email: @user.email, password: @user.password}, remember: true
    expect(response.headers["Set-Cookie"]).to include("expires=")
  end

  it "sets an impermanent cookie" do
    post :create, user: {email: @user.email, password: @user.password}
    expect(response.headers["Set-Cookie"]).to_not include("expires=")
  end
end
