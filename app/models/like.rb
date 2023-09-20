class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.update_likes_counter(post_id)
    post = Post.find(post_id)
    post.update(likesCounter: post.likes.count)
  end
end
