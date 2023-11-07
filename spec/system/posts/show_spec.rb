require 'rails_helper'

RSpec.describe 'PostShow', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Charlie', photo: 'test photo', bio: 'Walker', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Walking', text: 'Walk On', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post: @post, user: @user, text: 'Ahoy!')
    @like = Like.create(post: @post, user: @user)
    visit user_post_path(user_id: @user.id, id: @post.id)
  end

  it 'Should render post title' do
    expect(page).to have_content('Walking')
  end

  it 'Should render post user name' do
    expect(page).to have_content('Walking - Charlie')
  end

  it 'Should render post number of comments' do
    expect(page).to have_content('Comments: 1')
  end

  it 'Should render post number of likes' do
    expect(page).to have_content('Likes: 1')
  end

  it 'Should render post text' do
    expect(page).to have_content('Walk On')
  end

  it 'Should render user name of the comment' do
    expect(page).to have_content('Charlie:')
  end

  it 'Should render comment' do
    expect(page).to have_content('Charlie: Ahoy!')
  end
end
