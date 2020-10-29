Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :photos, except: :index

  root to: 'photos#index'

  get '/homes/home', to:'homes#index'

  resources :photos do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection  do
      get 'search'
    end
  end

  resources :users, only: :show do
    member do
      get 'mypage'
    end

    member do
      get :following, :followers
    end

    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
