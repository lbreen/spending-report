class AddTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :monzo_access_token, :string
    add_column :users, :monzo_refresh_token, :string
    add_column :users, :monzo_account_token, :string
    add_column :users, :monzo_token_expiry, :datetime
  end
end
