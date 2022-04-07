# frozen_string_literal: true

Rails.application.routes.draw do
  resources :game_sets
  resources :games
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#index'
  get '/landing', to: 'pages#landing'
end
