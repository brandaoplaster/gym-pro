Rails.application.routes.draw do
  namespace :backoffice do
    devise_for :auth, class_name: "User", controllers: {
      sessions: "backoffice/sessions"
    }

    root "dashboard#index"
    resources :users
    resources :workout_sheets
    resources :exercises
    resources :workouts
  end
end
