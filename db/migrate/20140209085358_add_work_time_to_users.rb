class AddWorkTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :work_time, :integer, default: 1500
    add_column :users, :break_time, :integer, default: 300
  end
end
