# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          provider: "github",
          uid: "123456789",
          info: {
                  email: "githubmock@example.com",
                  pasword: "password"
                },
        })

    OmniAuth.config.test_mode = true
  end

  test "login and logout" do
    visit root_path

    click_on "ログイン"
    assert_selector "h1", text: "書籍"

    click_on "ログアウト"
    assert_selector "h1", text: "書籍"
    assert_text "ログアウトしました"
  end

  test "follow and unfollow" do
    visit root_path

    click_on "ログイン"
    sleep(1)
    click_on "ユーザーの一覧"

    click_on "詳細画面へ", match: :first
    assert_text "ユーザー詳細画面"

    click_on "フォローする"
    click_on "フォロー解除する"
  end

  test "login and edit user data" do
    visit root_path

    click_on "ログイン"
    assert_selector "h1", text: "書籍"

    click_on "プロフィール編集"
    assert_text "githubmock@example.com"

    attach_file "user_icon", "#{Rails.root}/public/character_boy_normal.png"
    click_on "Update"
    assert_text "変更しました"
  end
end
