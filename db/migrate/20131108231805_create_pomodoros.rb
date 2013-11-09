class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :tag
    end
  end
end
