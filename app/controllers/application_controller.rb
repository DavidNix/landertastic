class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :application_or_admin

  def admin_authenticated?
    AdminAuthenticator.new(session).authenticated?
  end

  private

  def application_or_admin
    (params[:controller] =~ /^admin\//) ? "admin" : "application"
  end
end