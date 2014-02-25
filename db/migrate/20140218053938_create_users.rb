class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :work_time, default: 1500
      t.integer :break_time, default: 300
      t.timestamps
    end
  end
end
