require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users, :posts

  test "name is empty" do
    user = users(:two)
    assert user.name.empty?
  end

  test "name is not empty" do
    user = users(:one)
    assert_not user.name.empty?
  end

  test "posts_counter must be greater than or equal to 0" do
    user = users(:three)
    assert user.posts_counter >= 0
  end

  test "posts_counter must not be greater than or equal to 0" do
    user = users(:two)
    assert_not user.posts_counter >= 0
  end
  
  test "recent_post returns three most recent posts" do
    user = users(:one)

    recent_posts = user.recent_post

    assert_equal 3, recent_posts.length
    assert_equal posts(:one), recent_posts[0]
    assert_equal posts(:two), recent_posts[1]
    assert_equal posts(:three), recent_posts[2]
  end
  
end