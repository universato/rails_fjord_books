# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
    @bob_follow_alice =  UserRelation.create!(follower_id: users(:bob).id,
                                              followed_id: users(:alice).id)
  end

  test "valid user" do
    @user = users(:alice)
    assert @user.valid?
  end

  test "follow and following?" do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test "unfollow and following?" do
    assert @bob.following?(@alice)
    @bob.unfollow(@alice)
    assert_not @bob.following?(@alice)
  end

  test "from_omniauth" do
    provider = "github"
    uid      = "123456789"
    email    = "githubnewuser@example.com"

    auth = OmniAuth::AuthHash.new({
          provider: provider,
          uid: uid,
          info: {
                  email: email,
                },
        })

    user = User.from_omniauth(auth)

    assert user.valid?
    assert_equal provider, user.provider
    assert_equal uid,      user.uid
    assert_equal email,    user.email
  end
end
