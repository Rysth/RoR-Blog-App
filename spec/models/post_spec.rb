require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :posts, :comments

  it 'validates that title should not be empty' do
    post = posts(:one)
    expect(post.title).not_to be_empty
  end

  it 'validates that title should be empty' do
    post = posts(:two)
    expect(post.title).to be_empty
  end

  it 'validates that comments_counter should be greater than or equal to 0' do
    post = posts(:three)
    expect(post.comments_counter).to be >= 0
  end

  it 'validates that comments_counter should not be greater than or equal to 0' do
    post = posts(:two)
    expect(post.comments_counter).not_to be >= 0
  end

  it 'validates that likes_counter should be greater than or equal to 0' do
    post = posts(:one)
    expect(post.likes_counter).to be >= 0
  end

  it 'validates that likes_counter should not be greater than or equal to 0' do
    post = posts(:two)
    expect(post.likes_counter).not_to be >= 0
  end

  it 'validates that recent_comments returns five most recent comments' do
    post = posts(:one)

    recent_comments = post.recent_comments

    expect(recent_comments.length).to eq(5)
    expect(recent_comments[0]).to eq(comments(:one))
    expect(recent_comments[1]).to eq(comments(:two))
    expect(recent_comments[2]).to eq(comments(:three))
    expect(recent_comments[3]).to eq(comments(:four))
    expect(recent_comments[4]).to eq(comments(:five))
  end
end
