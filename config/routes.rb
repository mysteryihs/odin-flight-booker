Rails.application.routes.draw do
  resources :bookings, only: [:show, :new]

  post 'bookings/', to: 'bookings#create'
  get 'flights/index'
  root to: 'flights#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
