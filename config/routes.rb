Rails.application.routes.draw do

  root to: 'flats#index'

  devise_for :registrations, :controllers => { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :edit, :update ]

  resources :flats, only: [ :show, :new, :create ] do
    resources :bookings, only: [ :new, :create, :update ]
  end
  resources :bookings, only: [ :index ]



end
