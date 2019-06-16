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
  namespace :admins do
    resources :users
    resources :products
    resources :genres
    resources :labels
    resources :artists
    resources :reviews
    resources :musics
    resources :discs
  end


  resources :admins
<<<<<<< HEAD
  resources :users do
    resources :addresses
  end

  resources :carts
=======

  resources :users do
    resources :addresses
    resources :carts
  end


>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
  resources :orders do
    collection do
      get :success
    end
  end
  resources :order_details
  resources :products, only:[:index, :show, :create]
  resources :artists
  resources :favorites
  resources :reviews
  resources :labels
  resources :genres

end
