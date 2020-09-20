# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :icon])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :icon])
  end

  def after_sign_up_path_for(_)
    users_url
  end

  def after_update_path_for(user)
    user_url(user)
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  private
    def user_params
      params.require(:user).permit(:email, :icon)
    end
end
