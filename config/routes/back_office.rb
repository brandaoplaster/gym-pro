Rails.application.routes.draw do
  namespace :backoffice do
    devise_for :admins, class_name: "User", controllers: {
      sessions: "backoffice/sessions"
    }

    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :users
    resources :workout_sheets
    resources :exercises
    resources :workouts
  end
end
