# frozen_string_literal: true

module Backoffice
  class BackofficeApplication < ActionController::Base
    layout "admin"
    before_action :authorize_admin

    private

    def authorize_admin
      redirect_to client_root_path, alert: "Access Denied" unless current_user.admin?
    end
  end
end
