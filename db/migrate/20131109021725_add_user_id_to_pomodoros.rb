class AddUserIdToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :user_id, :integer
  end
end
