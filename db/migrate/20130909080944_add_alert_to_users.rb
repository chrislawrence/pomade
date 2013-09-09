class AddAlertToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alert, :boolean, default: false
  end
end
