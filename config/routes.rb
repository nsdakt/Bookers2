Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  #get 'users/:id' => 'users#show', as: :mypage
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :index, :show, :edit, :destroy, :update]
end
