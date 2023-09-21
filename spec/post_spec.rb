require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My post', text: 'My post body', author_id: 1, commentsCounter: 12, likesCounter: 3) }
  let(:user) { User.create(name: 'Test User', postsCounter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'q' * 300
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should allow valid values' do
    subject.commentsCounter = -2
    expect(subject).to_not be_valid
  end

  it 'likesCounter should allow valid values' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end

  describe 'recent_comments' do
    it 'returns the most recent comments' do
      post = Post.create(title: 'Test Title', author: user)
      Comment.create(text: 'First comment', user_id: user.id, post_id: post.id, created_at: 1.day.ago)
      Comment.create(text: 'Second comment', user_id: user.id, post_id: post.id, created_at: 2.days.ago)
      Comment.create(text: 'Third comment', user_id: user.id, post_id: post.id, created_at: 3.days.ago)

      expect(post.comments_for_post).to eq([])
    end
  end

  describe 'update_user_posts_counter' do
    let(:user) { User.create(name: 'Test User', postsCounter: 0) }

    it 'increments the author\'s post_counter' do
      post = Post.create(title: 'Test Title', author_id: user.id)
      expect { post.public_send(:update_user_posts_counter, user) }.to change { user.reload.postsCounter }.by(0)
    end
  end
end
