Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'
  # Routes: UsersController
  resources :users, only: [:index, :show] do
   # Routes: PostsController
   resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
   end
  end

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index]
      end
    end
  end
end
