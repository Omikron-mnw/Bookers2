Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  resources :books, only: [:new, :create, :index, :show, :destroy, :update]

  resources :users, only: [:show, :edit, :update, :index]
end
