class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name
      t.string :value
      t.integer :user_id
    end
  end
end
