Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  
  resources :items
  # resource :profil
  resources :avatars, only: [ :create, :update, :destroy ]

  post 'checkout/create', to: 'checkout#create'

  get "profil", to: "profils#index", as: :profil
  patch "profil", to: "profils#update"
  put "profil", to: "profils#update"
  get "profil/edit", to: "profils#edit", as: :edit_profil
  resource :profil, only: [:destroy]
end
