require 'spec_helper'

describe Admin::StatisticsController do
  include AuthSpecHelper

  describe "#index" do
    it "redirects unauthenticated admin" do
      get :index
      expect(response).to redirect_to(new_admin_session_path)
    end

    context "authenticated admin" do
      before { sign_in_admin }

      it "renders page correctly" do
        get :index

        expect(response).to be_success
        expect(response).to render_template("layouts/admin")
      end
    end
  end
end
