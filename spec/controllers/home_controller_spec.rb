require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "renders correct layout" do
      get :index
      expect(response).to render_template("layouts/application")
    end
  end
end
