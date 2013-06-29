require 'spec_helper'
  
describe Importer do
  it "takes a user ID and csv file" do
    user = create(:user)
    importer = Importer.new(user)
    importer.import(File.new('/Users/Chris/Downloads/tomatoes.csv'))
    expect(Pomodoro.count).to be(280)
    expect(Pomodoro.last.end_time).to eq(DateTime.new(2013,06,27,12,44,1))
  end
  
  it "creates a pomodoro based on the column" do
    user = create(:user)
    importer = Importer.new(user) 
    importer.parse_row(["2013-06-27 12:44:01 +1000","pomade"])
    expect(user.pomodoros.count).to eq(1)
  end
end
