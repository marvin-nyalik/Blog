require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Michael Owen', bio: 'Mike bio', photo: 'some link', postsCounter: 12) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should allow valid values' do
    subject.postsCounter = -2
    expect(subject).to_not be_valid
  end

  it 'returns three most recent posts' do
    user = create(:user)

    post1 = create(:post, author_id: user.id, created_at: 3.days.ago)
    post2 = create(:post, author_id: user.id, created_at: 2.days.ago)
    post3 = create(:post, author_id: user.id, created_at: 1.day.ago)
    create(:post, author_id: user.id)

    recent_posts = user.recent_posts(user.id)

    expected_posts = [post3, post2, post1]
    actual_post_attributes = recent_posts.map do |post|
      post.attributes.slice('title', 'text', 'commentsCounter', 'likesCounter', 'author_id')
    end
    expected_post_attributes = expected_posts.map do |post|
      post.attributes.slice('title', 'text', 'commentsCounter', 'likesCounter', 'author_id')
    end

    expect(actual_post_attributes).to eq(expected_post_attributes)
  end
end
