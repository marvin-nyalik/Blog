class ChangeDefaultForPostsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :postsCounter, :integer, default: 0
  end
end
