require 'rails_helper'

RSpec.describe 'PostsShow', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Bravo', photo: 'test photo', bio: 'Specer', posts_counter: 0)
    @posts = []
    5.times do |index|
      post = Post.create(author_id: @user.id, title: "Title_#{index}", text: 'Testing specs', comments_counter: 0,
                         likes_counter: 0)
      @posts << post
    end
    @comments = []
    5.times do |_index|
      comment = Comment.create(user: @user, post: @posts[1], text: 'Welcome World!')
      @comments << comment
    end
    @like = Like.create(user: @user, post: @posts[1])
    visit user_posts_path(user_id: @user.id)
  end

  it 'Should render user photo' do
    expect(page.html).to have_selector('#user-photo')
  end

  it 'Should render user name' do
    expect(page).to have_content('Bravo')
  end

  it 'Should render number of posts' do
    expect(page).to have_content('Number of posts: 5')
  end

  it 'Should render post title' do
    expect(page).to have_content('Title_1')
  end

  it 'Should render post text' do
    expect(page).to have_content('Testing specs')
  end

  it 'Should render first comments on a post' do
    expect(page).to have_selector('.comment', count: 5)
  end

  it 'Should render how many comments a post has' do
    expect(page).to have_content('Comments: 5')
  end

  it 'Should render how many likes a post has' do
    expect(page).to have_content('Likes: 1')
  end

  it 'Should render a section for pagination' do
    expect(page).to have_selector('#pagination')
  end

  it 'Should redirect to a post show page' do
    click_link('post-Title_1')
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @posts[1].id))
  end
end
