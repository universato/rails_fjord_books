# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid the book" do
    @user = users(:one)
    assert @user.valid?
  end

  test "valid follow, unfollow, following?" do
    @user = users(:one)
    @other_user = users(:two)
    assert_not @user.following?(@other_user)

    @user.follow(@other_user)
    assert @user.following?(@other_user)

    @user.unfollow(@other_user)
    assert_not @user.following?(@other_user)
  end
end
