module Client
  class SessionsController < Devise::SessionsController
    def create
      super do |resource|
        unless resource.client?
          sign_out resource
          flash[:alert] = "Restricted access to Clients"
          redirect_to new_client_session_path and return
        end
      end
    end
  end
end
