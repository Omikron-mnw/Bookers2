Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]

  resources :users, only: [:show, :edit, :update, :index, ]  #:ensure_correct_user
end
