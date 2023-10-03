class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false, unique: true
    add_index :users, :email, unique: true
  end
end
