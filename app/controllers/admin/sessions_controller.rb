class Admin::SessionsController < ApplicationController

  def new
    redirect_to admin_statistics_path if admin_authenticated?
  end

  def create
    authenticator = AdminAuthenticator.new(session, params[:admin])
    if authenticator.sign_in
      redirect_to admin_statistics_path
    else
      flash.now[:alert] = authenticator.error_message
      render :new
    end
  end

  def destroy
    AdminAuthenticator.new(session).sign_out
    redirect_to new_admin_sessions_path, notice: "You have been signed out."
  end

end
