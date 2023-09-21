require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My post', text: 'My post body', author_id: 1, commentsCounter: 12, likesCounter: 3) }

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
end
