Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users


  get'/movies/:id', to: "static_pages#index"

  resources :movies, only: [:index]

  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:show]
    end
  end
  
end
