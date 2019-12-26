Rails.application.routes.draw do
  get 'manuals/extract_subs'
  get 'manuals/things'
  devise_for :users
  resources :posts
  resources :tags, only: [:show]
  resources :categories
  resources :manuals
  resources :shifts
  root 'welcome#index'
end
