require 'rails_helper' # This loads Rails and prepares RSpec

RSpec.describe User, type: :model do
  fixtures :users, :posts

  it 'name is empty' do
    user = users(:two)
    expect(user.name).to be_empty
  end

  it 'name is not empty' do
    user = users(:one)
    expect(user.name).not_to be_empty
  end

  it 'posts_counter must be greater than or equal to 0' do
    user = users(:three)
    expect(user.posts_counter).to be >= 0
  end

  it 'posts_counter must not be greater than or equal to 0' do
    user = users(:two)
    expect(user.posts_counter).not_to be >= 0
  end

  it 'recent_post returns three most recent posts' do
    user = users(:one)

    recent_posts = user.recent_post

    expect(recent_posts.length).to eq(3)
    expect(recent_posts[0]).to eq(posts(:one))
    expect(recent_posts[1]).to eq(posts(:two))
    expect(recent_posts[2]).to eq(posts(:three))
  end
end
