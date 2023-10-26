require 'test_helper'

class PostTest < ActiveSupport::TestCase

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

end