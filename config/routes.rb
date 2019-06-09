Rails.application.routes.draw do

  root 'products#index'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins
  resources :users
  resources :addresses
  resources :carts
  resources :orders
  resources :order_details
  resources :products
  resources :discs
  resources :musics
  resources :artists
  resources :favorites
  resources :reviews
  resources :labels
  resources :genres
end
