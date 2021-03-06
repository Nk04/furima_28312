Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  root "items#index"
  resources :users, only: [:new, :create, :destroy]
  resources :items do
    resources :shipping_addresses, only: [:index, :create]
  end
end