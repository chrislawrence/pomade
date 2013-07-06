require 'spec_helper'

describe User do
  it 'generates a token on save' do
    user = create(:user)
    expect(user.auth_token).to_not be_nil
  end

  it "only allows letters and numbers in username" do
    user = create(:user, :username => 'bigboi10')
    User.count.should eq(1)
 end
  it "returns a hash of tags" do
    user = create(:user)
    user.pomodoros << [Pomodoro.new(:tag => 'working'), Pomodoro.new(:tag => 'study')]
    expect(user.tags).to eq([["working", 1], ["study", 1]])
  end

   it "changes the password" do
    user = create(:user)
    expect do
      user.new_password('test')
    end.to change{user.password}
    end

  it "destroys a pomodoro if it belongs to the user" do
    user = create(:user)
    user.pomodoros << Pomodoro.new
    id = user.pomodoros.first.id
    user.delete_pomodoro(id)
    expect(Pomodoro.count).to eq(0)
  end

  it "does not destroy a pomodoro if it doesn't belong to the user" do
    pomodoro = Pomodoro.create
    user = create(:user)
    user.delete_pomodoro(pomodoro.id)
    expect(Pomodoro.count).to be(1)
  end
  
  it "allows a valid username" do
    expect(build(:user, :username => "Dad01")).to be_valid
  end
  
  it "converts uppercase letters in username to downcase" do
    expect(create(:user, :username => "Dad01").username).to eq('dad01')  
  end
end
