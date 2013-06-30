class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
