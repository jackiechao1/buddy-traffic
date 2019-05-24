Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buddies do
  	resources :bookings, only: :create
    resources :reviews, only: :create
  end
  resources :bookings, only: [:destroy, :index] do 
  	patch :validate, to: 'bookings#validate'
  end
end
