# frozen_string_literal: true

require "test_helper"

class UserRelationTest < ActiveSupport::TestCase
  def test_normal
    user1 = users(:one)
    user2 = users(:two)
    follow = UserRelation.new(follower_id: user1.id, followed_id: user2.id)
    assert follow.valid?
  end

  def test_null_user
    user1 = users(:one)

    follow = UserRelation.new(follower_id: user1.id, followed_id: nil)
    assert follow.invalid?

    follow = UserRelation.new(follower_id: nil, followed_id: user1.id)
    assert follow.invalid?
  end

  def test_self_follow
    follow = UserRelation.new(follower_id: 1, followed_id: 1)
    assert follow.invalid?
  end
end
