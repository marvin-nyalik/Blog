class Comment < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :user_id

  after_save :update_comments_counter

  def update_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
