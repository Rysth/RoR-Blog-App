require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :posts, :comments

  test "title should not be empty" do
    post = posts(:one)
    assert_not post.title.empty?
  end

  test "title should be empty" do
    post = posts(:two)
    assert post.title.empty?
  end

  test "comments_counter should be greater than or equal to 0" do
    post = posts(:three)
    assert post.comments_counter >= 0
  end

  test "comments_counter should not be greater than or equal to 0" do
    post = posts(:two)
    assert_not post.comments_counter >= 0
  end

  test "likes_counter should be greater than or equal to 0" do
    post = posts(:one)
    assert post.likes_counter >= 0
  end

  test "likes_counter should not be greater than or equal to 0" do
    post = posts(:two)
    assert_not post.likes_counter >= 0
  end

  test "recent_comments returns five most recent comments" do
    post = posts(:one)

    recent_comments= post.recent_comments

    puts recent_comments.join(' ')

    assert_equal 5, recent_comments.length
    assert_equal comments(:one), recent_comments[0]
    assert_equal comments(:two), recent_comments[1]
    assert_equal comments(:three), recent_comments[2]
    assert_equal comments(:four), recent_comments[3]
    assert_equal comments(:five), recent_comments[4]
  end

end