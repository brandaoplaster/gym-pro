# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  protected

  def after_sign_in_path_for(resource)
    if resource.admin?
      backoffice_dashboard_path
    else
      clients_home_path
    end
  end
end
