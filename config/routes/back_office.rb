Rails.application.routes.draw do
  namespace :backoffice do
    root "dashboard#index"
    resources :users
    resources :workout_sheets
    resources :exercises
    resources :workouts
  end
end
