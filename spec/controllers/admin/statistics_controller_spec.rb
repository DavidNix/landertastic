require 'spec_helper'

describe Admin::StatisticsController do
  include AuthSpecHelper

  describe "#index" do
    it "redirects unauthenticated admin" do
      get :show
      expect(response).to redirect_to(new_admin_sessions_path)
    end

    context "authenticated admin" do
      before { sign_in_admin }

      it "renders page correctly" do
        get :show

        expect(response).to be_success
        expect(response).to render_template("layouts/admin")
        expect(assigns(:statistics)).to_not be_nil
      end
    end
  end

  describe "#destroy" do
    before do
      5.times { create(:hit) }
      3.times { create(:lead) }
    end
    it "destroys all data and redirects" do
      sign_in_admin
      AdminSettings.stub(:first).and_return(AdminSettings.new)
      AdminSettings.any_instance.stub(:update_attribute)
      delete :destroy

      expect(Lead.count).to eq 0
      expect(Hit.count).to eq 0
      expect(flash[:notice]).to_not be_nil
      expect(response).to redirect_to(admin_statistics_path)
    end

    it "resets admin experiment start date" do
      sign_in_admin
      settings = AdminSettings.first_or_initialize
      settings.save
      settings.update_attribute(:experiment_start_date, 1.day.ago)

      delete :destroy
      expect(AdminSettings.first.experiment_start_date).to be > 5.seconds.ago
    end

    it "does not allow unauthenticated admin to destroy data" do
      delete :destroy

      expect(Hit.count).to eq 5
      expect(Lead.count).to eq 3
    end
  end
end
