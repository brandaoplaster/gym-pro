Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, path: "", path_names: { sign_out: "logout" }

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  resources :users
  resources :workout_sheets
  resources :exercises
  resources :workouts
end
