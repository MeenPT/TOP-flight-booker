Rails.application.routes.draw do
  root to: "flights#index"
  resources :flights, only: [ :index ]
  resources :bookings, only: [ :new ]
  get "up" => "rails/health#show", as: :rails_health_check
end
