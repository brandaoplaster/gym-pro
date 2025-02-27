# frozen_string_literal: true

module Clients
  class ProfileController < ClientApplication
    before_action :set_user, only: %i[show]

    def show
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
