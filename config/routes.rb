# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
