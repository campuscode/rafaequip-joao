Rails.application.routes.draw do
  root 'home#index'

  resources :proposals, only:[:new, :create, :show, :index]
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :receipts, only: [:create]
    resources :received_receipts, only: [:create]
  end
  resources :receipts, only: [:show]
  resources :received_receipts, only: [:show]
  resources :equipment, only:[:new, :create, :show, :index]
  resources :prices, only:[:index]
  resources :landing, only:[:index, :create]

end
