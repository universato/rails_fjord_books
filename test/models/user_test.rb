# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid the book" do
    @user = users(:one)
    assert @user.valid?
  end
end
