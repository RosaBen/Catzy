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
  delete "cart_items/remove/:item_id", to: "cart_items#destroy", as: :remove_cart_item


  post "checkout/create", to: "checkout#create"

end
