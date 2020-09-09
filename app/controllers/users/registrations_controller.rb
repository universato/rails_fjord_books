# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # def create
  #   super
  #   icon.attach(icon)
  # end
  before_action :configure_permitted_parameters, only: [:create]

  def after_sign_up_path_for(_)
    users_url
  end

  private
    def user_params
      params.require(:user).permit(:email, :icon)
    end
end
