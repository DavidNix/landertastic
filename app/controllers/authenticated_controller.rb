class AuthenticatedController < ApplicationController
  before_action :authenticate_admin!

  def admin_authenticated?
    AdminAuthenticator.new(session).authenticated?
  end

  private

  def authenticate_admin!
    unless admin_authenticated?
      redirect_to new_admin_session_path, alert: "Please sign in to access that page."
    end
  end
end