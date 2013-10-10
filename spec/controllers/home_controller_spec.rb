require 'spec_helper'

describe HomeController do
  include AuthSpecHelper

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "renders correct layout" do
      get :index
      expect(response).to render_template("layouts/application")
    end

    it "records a hit" do
      expect {
        get :index
      }.to change(Hit, :count).by(1)
      hit = Hit.last
      expect(hit.ip_address).to eq "0.0.0.0"
      expect(hit.user_agent).to eq "Rails Testing"
    end

    it "does not record a hit if admin signed in" do
      sign_in_admin
      expect {
        get :index
      }.to change(Hit, :count).by(0)
    end
  end
end
