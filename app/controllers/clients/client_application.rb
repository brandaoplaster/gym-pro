module Clients
  class ClientApplication < ActionController::Base
    before_action :authorize_client!

    private

    def authorize_client!
      redirect_to client_root_path, alert: "Access Denied", unless curent_user.client?
    end
  end
end

