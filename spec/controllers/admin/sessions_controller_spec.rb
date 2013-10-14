require 'spec_helper'

describe Admin::SessionsController do
  include AuthSpecHelper

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end

    it "renders correct layout" do
      get :new
      expect(response).to render_template("layouts/admin")
    end

    it "redirects already authenticated admin" do
      sign_in_admin
      get :new

      expect(response).to redirect_to(admin_statistics_path)
    end
  end

  describe "#create" do
    it "creates session with valid username and password" do
      post :create, admin: {username: "admin", password: "secret"}

      expect(response).to redirect_to(admin_statistics_path)
      expect(session[:auth]).to_not be_nil
    end

    it "renders new with invalid username or password" do
      post :create, admin: {username: "admin", password: "wrong"}

      expect(response).to render_template :new
      expect(flash[:alert]).to eq "Username or password is incorrect."
      expect(session[:auth]).to be_nil
    end

    context "admin settings" do
      it "records appropriate settings" do
        post :create, admin: {username: "admin", password: "secret"}

        expect(AdminSettings.first.last_sign_in).to_not be_nil
        expect(AdminSettings.first.failed_attempts).to eq 0
      end

      it "prevents sign in after too many failed attempts" do
        settings = AdminSettings.first_or_initialize
        settings.failed_attempts = AdminAuthenticator::NUM_FAILED_ATTEMPTS - 1
        settings.save

        post :create, admin: {username: "not", password: "good"}
        expect(AdminSettings.first.failed_attempts).to eq AdminAuthenticator::NUM_FAILED_ATTEMPTS

        post :create, admin: {username: "admin", password: "secret"}
        expect(flash[:alert]).to match /this account is locked/i
      end
    end
  end

  describe "#destroy" do
    it "destroys session" do
      sign_in_admin
      expect(session[:auth]).to_not be_nil
      delete :destroy

      expect(session[:auth]).to be_nil
      expect(response).to redirect_to(new_admin_session_path)
      expect(flash[:notice]).to eq "You have been signed out."
    end
  end
end
