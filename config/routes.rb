Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :photos, except: :index
  root to: 'photos#index'
  get '/homes/home', to:'homes#index'
  resources :photos do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
