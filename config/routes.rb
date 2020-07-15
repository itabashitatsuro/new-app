Rails.application.routes.draw do
  root 'diaries#index'
  devise_for :users
  resources :diaries
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
