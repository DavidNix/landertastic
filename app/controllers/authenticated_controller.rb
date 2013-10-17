class AuthenticatedController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    unless admin_authenticated?
      redirect_to new_admin_sessions_path, alert: "Please sign in to access that page."
    end
  end
end