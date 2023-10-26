require 'test_helper'

class UserTest < ActiveSupport::TestCase

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
  
  
end