require 'spec_helper'

describe 'SignupFeatures' do
  it "signs up using the form and is redirected to the timer" do
    visit signup_path
    user = build(:user)
    fill_in 'Email', :with => user.email
    fill_in 'Username', :with => user.username
    fill_in 'user[password]', :with => user.password
    fill_in 'Confirm Password', :with => user.password
    click_button "Create Account"
    expect(page).to have_content('Account created.') 
  end

  it "does not allow signup with existing email" do
    user = create(:user)
    visit signup_path
    fill_in 'Email', :with => user.email
    fill_in 'Username', :with => user.username
    fill_in 'user[password]', :with => user.password
    fill_in 'Confirm Password', :with => user.password
    click_button "Create Account"
    expect(page).to have_content("has already been taken")
  end
  
  it "does not show signup if already logged in" do
    user = create(:user)
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log In"
    visit signup_path
    expect(current_path).to_not eq(signup_path)
  end

  it "does not allow a reserved word as username" do
    user = build(:user, :username => 'users')
    visit signup_path
    fill_in 'Email', :with => user.email
    fill_in 'Username', :with => user.username
    fill_in 'user[password]', :with => user.password
    fill_in 'Confirm Password', :with => user.password
    click_button "Create Account"
    expect(page).to have_content('not available')
  end
end
