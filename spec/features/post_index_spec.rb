# rubocop:disable Metrics/BlockLength
require 'rails_helper'
RSpec.feature 'Post Index Page' do
  before(:each) do
    @user2 = create(:user)
    @user1 = create(:user, name: 'user1', bio: 'Teacher from Uganda', photo: 'user1_profile_image.jpg', postsCounter: 0)
    @post1 = create(:post, author_id: @user1.id, title: 'Hello')
    @post2 = create(:post, author_id: @user1.id, title: 'World', text: 'Hi men', commentsCounter: 1, likesCounter: 2)
    @comment = create(:comment, post_id: @post2.id, user_id: @user2.id, text: 'a comment')
  end
  scenario 'I can see the username of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@user1.name)
  end
  scenario 'I can see the profile picture for each user' do
    visit user_posts_path(@user1)
    expect(page).to have_css('img[src*="user1_profile_image.jpg"]')
  end
  scenario 'I can see the number of posts of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@user1.postsCounter)
  end
  scenario 'I can a posts title' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post2.title)
  end
  scenario 'I can some of the post body' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post2.text)
  end
  scenario 'I can see the comments on a post' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@comment.text)
  end
  scenario 'I can see the number of comments on a post' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post2.commentsCounter)
  end
  scenario 'I can see the number of likes a post has' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post2.likesCounter)
  end
  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    visit user_path(@user1)
    expect(page).to have_link(@post2.title)
    click_link @post2.title
    expect(current_path).to eq(user_post_path(@user1, @post2))
  end
  scenario 'User sees pagination links' do
    posts_per_page = 3
    total_posts = posts_per_page + 1
    total_posts.times do |i|
      create(:post, title: "Post #{i + 1}", author_id: @user2.id)
    end
    visit user_posts_path(@user2)
    expect(page).to have_link('Next')
    expect(page).to have_link('2')
  end
end
# rubocop:enable Metrics/BlockLength