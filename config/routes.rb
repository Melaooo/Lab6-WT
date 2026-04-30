Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "owners#index"

  resources :owners
  resources :pets
  resources :vets
  resources :appointments do
    resources :treatments, only: [:new, :create, :edit, :update, :destroy]
  end

end
  