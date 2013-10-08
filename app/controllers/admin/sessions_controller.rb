class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    authenticator = AdminAuthenticator.new(session, params[:admin])
    if authenticator.sign_in
      redirect_to admin_statistics_path
    else
      flash[:alert] = authenticator.error_message
      render :new
    end
  end

  def destroy
    AdminAuthenticator.new(session).sign_out
    redirect_to new_admin_session_path, notice: "You have been signed out."
  end

end
