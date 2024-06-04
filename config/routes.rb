Rails.application.routes.draw do
  get 'regions/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :user_spots, only: [:new, :create, :index, :delete]
  resources :fishes, only: [:new, :create]
  resources :regions do
    resources :spots do
      resources :fish_spots, only: [:new, :create, :index, :delete]
    end
  end
  resources :users, only: [:index, :edit, :update, :destroy]
  
end
