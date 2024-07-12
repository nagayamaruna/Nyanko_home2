Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  devise_for :users
  resources :nyankos, only: [:new, :index, :show, :edit]
  resources :users, only: [:show, :edit]
end
