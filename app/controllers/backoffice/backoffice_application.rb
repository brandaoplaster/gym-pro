# frozen_string_literal: true

module Backoffice
  class BackofficeApplication < ActionController::Base
    layout "admin"
    before_action :authenticate_backoffice_admin!
  end
end
