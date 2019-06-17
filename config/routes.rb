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

  resources :users do
    resources :addresses
    resources :carts
  end

  patch "/users/:id/carts/:id/update" => "carts#update"

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

  post 'reviews' => 'reviews#create'
  delete 'reviews' => 'reviews#destroy'

end
