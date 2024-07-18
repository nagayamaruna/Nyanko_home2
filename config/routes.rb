Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/home/about', to: 'homes#about'
  devise_for :users
  resources :nyankos, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit, :update]
  resources :nyankograms, only: [:new, :index, :show]
end
