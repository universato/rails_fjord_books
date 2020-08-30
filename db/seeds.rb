# frozen_string_literal: true

n  = 100
start_id = Book.last.id

n.times do |diff|
  id = start_id + diff
  title  = "Title #{id}"
  memo   = "Memo #{id}"
  author = "Author #{id}"
  Book.create!(title: title, memo: memo, author: author)
end
