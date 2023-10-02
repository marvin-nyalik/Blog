# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'User Show Page' do
  before(:each) do
    @user1 = create(:user, name: 'user1', bio: 'Teacher from Uganda', photo: 'user1_profile_image.jpg', postsCounter: 0)
    @post1 = create(:post, author_id: @user1.id, title: 'Madagascar is Bae')
    @post2 = create(:post, author_id: @user1.id, title: 'World of authentic vibes')
    @post3 = create(:post, author_id: @user1.id, title: 'Arcing retremony')
    @post4 = create(:post, author_id: @user1.id, title: 'Joe of the guitar')
  end
  scenario 'I can see the username of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the profile picture for each user' do
    visit user_path(@user1)

    expect(page).to have_css('img[src*="user1_profile_image.jpg"]')
  end

  scenario 'I can see the number of posts of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.postsCounter)
  end

  scenario 'I can see the bio of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.bio)
  end

  scenario 'I can see a button to view user\'s posts' do
    visit user_path(@user1)

    expect(page).to have_content('See all posts')
  end

  scenario 'I can see the last 3 posts of the user' do
    visit user_path(@user1)

    expect(page).to have_text(@post4.title, wait: 10)
    expect(page).to have_text(@post2.title, wait: 10)
    expect(page).to have_text(@post3.title, wait: 10)
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    visit user_path(@user1)
    expect(page).to have_link(@post2.title)
    click_link @post2.title

    expect(current_path).to eq(user_post_path(@user1, @post2))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    visit user_path(@user1)

    click_link 'See all posts'

    expect(current_path).to eq(user_posts_path(@user1))
  end
end
# rubocop:enable Metrics/BlockLength