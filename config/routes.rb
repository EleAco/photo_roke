Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  root to: 'photos#index'
  get '/homes/home', to:'homes#index'
end
