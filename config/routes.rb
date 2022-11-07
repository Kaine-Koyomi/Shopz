Rails.application.routes.draw do
  get 'users/show'
  get "edit_profile", to: "users#edit"
  patch "profile", to: "users#update"
  get 'comment/create'
  get 'cart/show'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  post 'products/add_to_favorites/:id', to: 'products#add_to_favorite', as: 'add_to_favorite'
  delete 'cart/delete_item/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  devise_for :users
  root "products#index"
  devise_for :sellers
  resources :products
  resources :favorites, only: %i[create destroy index]
  resources :comments, only: %i[create]
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
