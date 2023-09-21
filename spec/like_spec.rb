require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model' do
    let(:user) { create(:user, name: 'Ansar', photo: 'Image', bio: 'Developer', postsCounter: 0) }
    let(:post) do
      create(:post, title: 'test title', text: 'test text', commentsCounter: 0, likesCounter: 0, author_id: user.id)
    end

    it 'should have an integer post_id' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.post_id = 'string'
      expect(like).to_not be_valid
    end

    it 'should have an integer user_id' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.user_id = 'string'
      expect(like).to_not be_valid
    end

    describe '#update_likes' do
      it 'should increment the like_counter of the associated post' do
        like = create(:like, user:, post:)

        expect do
          like.send(:update_likes_counter, post.id)
          post.reload
        end.to change(post, :likesCounter).by(1)
      end
    end
  end
end
