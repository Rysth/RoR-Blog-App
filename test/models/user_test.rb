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

  
end