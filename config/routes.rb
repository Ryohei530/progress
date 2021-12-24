Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  post '/static_pages/guest_sign_in', to: 'static_pages#guest_sign_in'
  get '/rank', to: 'static_pages#rank'
  # get '/signup', to: 'users#new'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  resources :vue, only: [:index]
  
  resources :users do
    member do
     get 'goal'
     get 'monthly_goal'
     get 'report'
     get 'post'
     get 'liked_posts'
     get 'liked_reports'
    # get 'email'
    # get 'password'
    end
  end
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :post_likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :goals, except: [:new, :create]
  resources :monthly_goals
  resources :reports do
    resources :report_likes, only: [:create, :destroy]
    resources :report_comments, only: [:create, :destroy]
  end
  resources :articles do
    resources :article_comments, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :boards do
    resources :board_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :tags, only: :index do
    get 'articles', to: 'articles#tag'
    get 'boards', to: 'boards#tag'
    
  end
  resources :bookmarks, only: :index
end
