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

end