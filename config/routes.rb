Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  namespace :admin do
    get 'nyankogram_post_comments', to: 'nyankogram_post_comment#index'
    resources :nyankogram_post_comments, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top"
    get '/home/about', to: 'homes#about'
    get "/search", to: "searches#search"
    devise_for :users

    resources :nyankograms, only: [:new, :show, :create, :index, :destroy] do
      resources :nyankogram_post_comments, only: [:create]
      resources :favorites, only: [:create, :destroy]
    end
    resources :nyankos, only: [:new, :create, :index, :show, :edit, :destroy, :update]
    resources :users, only: [:show, :edit, :update]
  end



end
