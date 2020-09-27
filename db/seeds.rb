# frozen_string_literal: true

n  = 10
start_id = Book.count.zero? ? 0 : Book.last.id

n.times do |diff|
  id = start_id + diff
  title  = "Title #{id}"
  memo   = "Memo #{id}"
  author = "Author #{id}"
  Book.create!(title: title, memo: memo, author: author)
end

n  = 100
start_id = User.count.zero? ? 0 : User.last.id

n.times do |diff|
  id = start_id + diff
  email    = "#{id}@example.com"
  provider = "test-provider"
  uid      = id
  password = Devise.friendly_token[0, 20]
  User.create!(email: email, provider: provider, uid: uid, password: password)
end
