# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 50
  config.max_per_page     = 2000
  config.window           = 3
end
