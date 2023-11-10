Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/sessions'
  }
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

  namespace :api, defaults: { format: :json } do # localhost:3000/api
    resources :sessions
    resources :users, only: [:index] do # localhost:3000/api/users
      resources :posts, only: [:index] do # localhost:3000/api/users/:user_id/posts
        resources :comments, only: [:index, :create] #localhost:3000/api/users/:user_id/posts/:post_id/comments
      end
    end
  end


end
