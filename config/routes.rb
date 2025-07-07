Rails.application.routes.draw do
# TODO: replace root path
root "items#index"
resources :items
end
