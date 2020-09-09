# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :icon, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :icon, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :icon, :avatar])
  end
end
