Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only: [:new, :create, :show]
end
