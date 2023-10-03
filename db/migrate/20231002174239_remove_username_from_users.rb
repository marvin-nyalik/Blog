class RemoveUsernameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :username, unique: true
    remove_column :users, :username, :string
  end
end
