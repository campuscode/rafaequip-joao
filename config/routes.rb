Rails.application.routes.draw do
  root 'home#index'
  resources :proposals, only:[:new, :create, :show, :index]
  resources :contracts, only:[:new, :create, :show]
  resources :equipment, only:[:new, :create, :show]
end
