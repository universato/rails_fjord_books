# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_out_path_for(resource)
    books_url
  end
end
