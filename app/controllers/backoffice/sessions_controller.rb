# frozen_string_literal: true

module Backoffice
  class SessionsController < Devise::SessionsController
    layout "admin"

    def create
      super do |resource|
        unless resource.admin?
          sign_out resource
          flash[:alert] = "Restricted access to Backoffice"
          redirect_to new_admin_session_path and return
        end
      end
    end
  end
end
