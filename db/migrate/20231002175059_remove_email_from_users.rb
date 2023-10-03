class RemoveEmailFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email, unique: true
    remove_column :users, :email, :string
  end
end
