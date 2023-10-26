require 'rails_helper'

RSpec.describe Like, type: :model do
  fixtures :users, :posts

  it 'updates likes_counter after a new like is created' do
    Like.create(user: users(:one), post: posts(:one))
    original_likes_counter = posts(:one).likes_counter

    expect(posts(:one).reload.likes_counter).to eq(original_likes_counter)
  end
end
