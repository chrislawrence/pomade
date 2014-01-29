class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :token
    add_column :users, :authentication_token, :string

  end
end
