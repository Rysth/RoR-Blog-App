require 'rails_helper'

RSpec.describe Comment, type: :model do
  fixtures :users, :posts

  it "updates comments_counter after a new comment is created" do
    comment = Comment.create(user: users(:one), post: posts(:one), text: "New comment")
    original_comments_counter = posts(:one).comments_counter

    expect(posts(:one).reload.comments_counter).to eq(original_comments_counter)
  end
end
