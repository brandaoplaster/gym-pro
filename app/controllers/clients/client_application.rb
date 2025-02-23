# frozen_string_literal: true

module Clients
  class ClientApplication < ApplicationController
    layout "client"
    before_action :authenticate_clients_client!

    def current_client
      current_clients_client
    end

    helper_method :current_client
  end
end
