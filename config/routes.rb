Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :items
  resource :profil
  resources :avatars, only: [ :create, :update, :destroy ]

  post "checkout/create", to: "checkout#create"

end
