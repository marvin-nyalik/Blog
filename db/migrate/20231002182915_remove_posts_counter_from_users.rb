class RemovePostsCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postsCounter, :integer
  end
end
