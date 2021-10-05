Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
   resource :relationships, only: [:create, :destroy]
   get :follows, on: :member
   get :followers, on: :member
  end

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  get '/search', to: 'searches#search'

   #get 'users/:id' => 'users#show', as: :mypage
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end