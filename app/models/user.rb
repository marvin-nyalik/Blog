class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts(user_id)
    user = User.includes(:posts).find(user_id)
    user.posts.order(created_at: :desc).limit(3)
  end
end
