class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :encrypted_password, :string, null:false, default:""
    add_index :users, :username, unique: true
  end
end
