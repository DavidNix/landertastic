require 'spec_helper'

describe AuthenticatedController do
  include AuthSpecHelper
  controller(AuthenticatedController) do
    def index
      render text: "OK"
    end
  end

  describe "#authenticate_admin!" do
    it "allows authenticated admin" do
      sign_in_admin
      get :index
      expect(response).to be_success
    end

    it "redirects unauthenticated admin" do
      get :index
      expect(response.code.to_i).to eq 302
      expect(flash[:alert]).to match(/Please sign in/)
    end
  end
end