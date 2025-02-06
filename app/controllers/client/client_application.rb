module Client
  class ClientApplication < ActionController::Base
    before_action :authorize__client!

    private

    def authorize__client!
      redirect_to client_root_path, alert: "Access Denied", unless curent_user.client?
    end
  end
end

