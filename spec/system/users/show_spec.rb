require 'rails_helper'

RSpec.describe "UsersShows", type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Bravo', photo: 'test photo', bio: 'Specer', posts_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Specing', text: 'Testing specs', comments_counter: 0, likes_counter: 0)
    visit user_path(id: @user.id)
  end

  it 'Should render user photo' do
    expect(page.html).to include('user-photo')
  end

  it 'Should render user name' do
    expect(page).to have_content('Bravo')
  end

  it 'Should render number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'Should render user bio' do
    expect(page).to have_content('Specer')
  end

  it 'Should render user first 3 posts' do
    expect(page).to have_selector('#user-photo', count: 1)
  end

  it 'Should render see all posts button' do
    expect(page).to have_link('See all posts')
  end
  
  it 'Should redirect to all post show page' do
    click_link('post-Specing')
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @post.id))
  end
  it 'redirects to the user\'s posts page when the button See all posts is clicked' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(user_id: @user.id))
  end
end