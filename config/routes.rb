Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :posts do
    resources :comments, only: [:create, :destroy] # Nested for post comments
    resources :likes, only: [:create, :destroy]    # Nested for post likes
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :albums, only: [:index, :show, :create, :destroy]
  resources :messages, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root "posts#index"  # Set homepage to show posts
end
