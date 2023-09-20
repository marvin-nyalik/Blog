class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_user_posts_counter
    user.update(postsCounter: user.posts.count)
  end

  def comments_for_post
    comments.order(created_at: :desc).limit(5)
  end
end
