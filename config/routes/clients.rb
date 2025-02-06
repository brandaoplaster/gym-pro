Rails.application.routes.draw do
  namespace :client do
    root "dashboard#index"

    devise_for :auth, class_name: "User", skip: [:registrations], controllers: {
      sessions: "clients/sessions"
    }
  end
end
