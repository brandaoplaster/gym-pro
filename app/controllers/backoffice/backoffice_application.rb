module Backoffice
  class BackofficeApplication < ActionController::Base
    before_action :authorize__admin!

    private

    def authorize__admin!
      redirect_to client_root_path, alert: "Access Denied", unless curent_user.admin?
    end
  end
end
