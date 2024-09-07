Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'users#index'
    get 'dashboards', to: redirect('admin/users')
    resources :nyankogram_post_comments, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top"
    get '/home/about', to: 'homes#about'
    get "/search", to: "searches#search"
    get '/nyanko/hashtag/:name' => 'nyankos#hashtag'
    devise_for :users

    resources :nyankograms, only: [:new, :show, :create, :index, :destroy] do
      resources :nyankogram_post_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    
    resources :nyankos, only: [:new, :create, :index, :show, :edit, :destroy, :update]
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
    
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
    
    resources :notifications, only: [:index] do
      collection do
        patch 'mark_as_read'
      end 
    end 
    
  end
  
end
