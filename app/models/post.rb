class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_user_posts_counter
    user.update(postsCounter: user.posts.count)
  end

  def comments_for_post
    comments.order(created_at: :desc).limit(5)
  end
end
