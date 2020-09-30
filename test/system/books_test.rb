# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "書籍"
  end

  test "creating a Book" do
    visit books_url
    click_on "新規作成する"

    fill_in "タイトル", with: "姑獲鳥の夏"
    fill_in "メモ", with: "京極夏彦デビュー作"
    fill_in "著者", with: "京極夏彦"

    click_on "登録する"
    assert_text "新規作成しました"
  end

  test "updating a Book" do
    visit books_url
    click_on "編集する", match: :first

    fill_in "タイトル", with: "姑獲鳥の夏"
    fill_in "メモ", with: "京極夏彦デビュー作"
    fill_in "著者", with: "京極夏彦"

    click_on "更新する"
    assert_text "更新しました"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "削除する", match: :first
    end

    assert_text "削除しました"
  end
end
