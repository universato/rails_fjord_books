# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "books#index"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations", sessions: "users/sessions" }
  resources :books
  resources :users, only: [:index, :show, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :user_relations, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
