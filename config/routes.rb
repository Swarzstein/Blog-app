Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'
  resources :users, only: [:index, :show] do 
    resources :posts, except: [:delete] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
