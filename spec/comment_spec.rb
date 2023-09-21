# require 'test_helper'

# class CommentTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model' do
    let(:user) { create(:user, name: 'Marvin', photo: 'Image', bio: 'developer', postsCounter: 0) }
    let(:post) do
      create(:post, title: 'test title', text: 'test text', commentsCounter: 0, likesCounter: 0, author_id: user.id)
    end

    it 'text should not be blank' do
      comment = build(:comment, user:, post:)
      expect(comment).to be_valid
    end

    it 'post id must be integer' do
      comment = build(:comment, user:, post:, post_id: nil)
      expect(comment).to_not be_valid
    end

    it 'user id must be integer' do
      comment = build(:comment, user:, post:, user_id: nil)
      expect(comment).to_not be_valid
    end

    it 'should increment the comment counter' do
      comment = build(:comment, user:, post:)

      expect do
        comment.save
        post.reload
      end.to change(post, :commentsCounter).by(0)
    end
  end
end
