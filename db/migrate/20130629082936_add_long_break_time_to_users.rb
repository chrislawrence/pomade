class AddLongBreakTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :long_break_time, :integer, default: 15
  end
end
