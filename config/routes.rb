Rails.application.routes.draw do
  root 'home#index'
  scope '/admin' do
  	resources :contracts, only:[:new, :create, :show, :index] 
  	resources :prices, only:[:index]
  	resources :receipts, only: [:create, :show]
  	resources :equipment, only:[:new, :create, :show, :index]
  	resources :proposals, only:[:index, :show]
  end
  	
  	resources :proposals, only:[:new, :create]
end
