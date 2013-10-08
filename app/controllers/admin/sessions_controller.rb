class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    if authenticator.sign_in
      redirect_to admin_statistics_path
    else
      flash[:alert] = "Username or password is incorrect."
      render :new
    end

  end

  def destroy
    authenticator.sign_out
    redirect_to new_admin_session_path, notice: "You have been signed out."
  end

  private

  def authenticator
    AdminAuthenticator.new(session, params[:admin])
  end

end
