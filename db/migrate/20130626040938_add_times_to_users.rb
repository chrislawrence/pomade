class AddTimesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :work_time, :integer, :default => 25
    add_column :users, :break_time, :integer, :default => 5
  end
end
