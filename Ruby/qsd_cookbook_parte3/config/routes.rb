Rails.application.routes.draw do
  root to: 'home#index'
  get "recipe/:recipeid", to: "home#recipe", as: "recipeid"
end
