require 'spec_helper'

describe 'UserFeatures' do
  it "logs in with an existing account" do
    user = create(:user)
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log In"
    expect(page).to_not have_content('Email or password was invalid')
  end
  it "does not log in to a fake account" do
    visit login_path
    fill_in "Email", :with => "fake@fake.com"
    fill_in "Password", :with => "fake"
    click_button "Log In"
    expect(page).to have_content("Email or password was invalid")
  end

end
