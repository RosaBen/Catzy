Rails.application.routes.draw do
  get "carts/show"
  get "cart_items/create"
  devise_for :users

  root to: "items#index"

  resources :items
  resource :profil
  resources :avatars, only: [ :create, :update, :destroy ]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create]
  
  post "checkout/create", to: "checkout#create"

end
