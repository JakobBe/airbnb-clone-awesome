Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'flats#index'

  devise_for :registrations, :controllers => { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :edit, :update ]

  resources :flats do
    resources :bookings, only: [ :update, :create ]
  end


  get "myflats", to: "flats#show_my_flats"

  resources :bookings, only: [ :index]

end
