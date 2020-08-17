# frozen_string_literal: true

require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "must have title" do
    @empty_title_book = Book.new
    assert_not @empty_title_book.valid?
    assert_not @empty_title_book.save
  end

  test "valid the book" do
    @book = books(:one)
    assert @book.valid?
  end
end
