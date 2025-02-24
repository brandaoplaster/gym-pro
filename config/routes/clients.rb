Rails.application.routes.draw do
  namespace :clients do
    get "home", to: "home#index", as: "home"
    resources :profile

    devise_for :client, class_name: "User", skip: [:registrations],
                        controllers: {
                          sessions: "clients/sessions",
                        }
  end
end
