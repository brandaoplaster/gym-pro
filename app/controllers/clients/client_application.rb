module Clients
  class ClientApplication < ApplicationController
    layout "client"
    before_action :authorize_client!

    private

    def authorize_client!
      redirect_to client_root_path, alert: "Access Denied" unless current_clients_client.client?
    end
  end
end
