# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_)
    books_url
  end
  def after_sign_out_path_for(_)
    books_url
  end
end
