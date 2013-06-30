require 'spec_helper'

describe PasswordReset do
  it "generates a new token given a user" do
    user = create(:user)
    PasswordReset.create(:email => user.email)
    PasswordReset.first.token.should_not be_nil
    PasswordReset.first.email.should eq(user.email)
  end

  it "resets a password if token is correct" do
    user = create(:user)
    reset = PasswordReset.create(:email => user.email)
    PasswordReset.reset_password(user.email, reset.token, 'test')
    expect(user.reload.password).to eq('test')
  end

  it "does not reset password if token in incorrect" do
    user = create(:user)
    PasswordReset.reset_password(user.email, 'fake','test')
    expect{user.reload}.to_not change{user.password}
  end
end
