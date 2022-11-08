Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users

  get'/movies/:id', to: "static_pages#index"
  get'/movies/:id/reviews/new', to: "static_pages#index"

  resources :movies, only: [:index]

  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:show] do
        resources :reviews, only: [:create]
      end
      get'/current-user', to: "current_user#index"
    end
  end
end
