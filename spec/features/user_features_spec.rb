include 'spec_helper'

describe 'UserFeatures' do
  it "logs in with an existing account" do
    user = create(:user)
    visit_login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log In"
    expect(current_path).to eq(timer_path)
  end
end
