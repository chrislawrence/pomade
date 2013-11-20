require "spec_helper"
  
feature "User management" do
  scenario "Creating a new account" do
    user = build(:user)
    visit "/"
    click_on "sign up"
    fill_in "email", user.email
    fill_in "password", user.password
    click_on "create account"
    expect(page).to have_content("Account created")
  end

  scenario "Clicking account confirmation link" do
    create(:user)
    current_email.click_link "confirm your account"
    expect(page).to have_content("Account confirmed")
  end

  scenario "Changing password" do
    login
    visit "/password"
    fill_in "old password", @user.password
    fill_in "new password", 'new'
    fill_in "confirm new password", 'new'
    click_on "Change password"
    expect(page).to have_content("Password successfully changed")
  end
  
  scenario "Changing email address" do
    login
    visit "/email"
    fill_in "password", @user.password
    fill_in "new email", 'new@test.com'
    click_on "Change email"
    expect(page).to have_content("Check your inbox to confirm your new email address")
  end

  scenario "Changing preferences" do
  end

  scenario "Closing account" do
  end

  def login
    @user = create(:user)
    visit ("/login")
    fill_in "email", @user.email
    fill_in "password", @user.password
    click_link "Log in"
  end
end
