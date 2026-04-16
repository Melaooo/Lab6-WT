Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "owners#index"

  resources :owners, only: [:index, :show]
  resources :pets, only: [:index, :show]
  resources :vets, only: [:index, :show]
  resources :appointments, only: [:index, :show]

end
  