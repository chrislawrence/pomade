require 'spec_helper'

describe User do
  it "returns the default value for a preference" do
    u = User.new
    expect(u.preferred(:work_time)).to eq(25)
  end
  it "sets a preference for a user" do
    u = create(:user)
    u.write_preference(:work_time, 10)
    expect(u.preferred(:work_time)).to eq(10)
  end
end
