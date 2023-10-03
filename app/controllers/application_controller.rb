class ApplicationController < ActionController::Base
  before_action :set_current_user
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || users_path
  end

  private

  def set_current_user
    @current_user = current_user
  end
end
