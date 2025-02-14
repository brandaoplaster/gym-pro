# frozen_string_literal: true

module Clients
  class ClientApplication < ApplicationController
    layout "client"
    before_action :authenticate_clients_client!
  end
end
