require 'spec_helper'

describe Admin::StatisticsController do

  describe "#index" do
    it "redirects unauthenticated admin" do
      get :index
      expect(response).to redirect_to(new_admin_session_path)
    end
  end

end
