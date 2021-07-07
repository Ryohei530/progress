Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/rank', to: 'static_pages#rank'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
     get 'goal'
     get 'report'
     get 'post'
     get 'liked_posts'
     get 'liked_reports'
    end
  end
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :post_likes, only: [:create, :destroy]
  end
  resources :goals
  resources :reports do
    resources :report_likes, only: [:create, :destroy]
  end
  resources :articles do
    resources :article_comments, only: :create
    resources :bookmarks, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :boards 
  resources :tags do
    get 'articles', to: 'articles#tag'
  end
  resources :bookmarks, only: :index
end
