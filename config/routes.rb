Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :receipts, only: [:create]
    resources :received_receipts, only: [:create]
    member do
      post 'finish'
    end
  end	
	resources :receipts, only: [:show]
  resources :received_receipts, only: [:show]
	resources :prices, only:[:index] 	
	resources :equipment, only:[:new, :create, :show, :index]
	resources :proposals, only:[:new, :create, :show, :index]
  resources :landing, only:[:index, :create]
end
