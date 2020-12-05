Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  # get 'relationship/follows' => 'relationship#follows'
  # get 'relationship/follers' => 'relationship#folloers'

  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy, :show, :index]
  resources :users, only: [:show, :edit, :update, :index]  #:ensure_correct_user
end
