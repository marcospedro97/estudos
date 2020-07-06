Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :subsidiaries
  resources :car_category
  resources :car_model, only: [:index, :show, :new, :create]
end
