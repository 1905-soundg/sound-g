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
    resources :orders do
    collection do
      get :success
    end
  end
  end


  resources :order_details
  resources :products, only:[:index, :show, :create] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :artists
  resources :favorites
  resources :reviews
  resources :labels
  resources :genres

  post 'reviews' => 'reviews#create'
  delete 'reviews' => 'reviews#destroy'
  post 'reviews/:id/edit' => 'admins/reviews#edit'
  post "reviews/:id/update" => "admins/reviews#update"



end
