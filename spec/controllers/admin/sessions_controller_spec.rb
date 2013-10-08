require 'spec_helper'

describe Admin::SessionsController do
  include AuthSpecHelper

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
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
