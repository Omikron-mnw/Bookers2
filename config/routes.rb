Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  # resources :homes do
  #   member do
  #     get 'about'
  #   end
  # end

  resources :books, only: [:new, :create, :index, :show, :destroy, :update]

  resources :users, only: [:show, :edit, :update, :index]
end
