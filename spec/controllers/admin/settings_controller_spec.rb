require 'spec_helper'

describe Admin::SettingsController do
  include AuthSpecHelper

  describe "#edit" do
    it "returns success" do
      sign_in_admin
      get :edit
      expect(response).to be_success
      expect(response).to render_template("layouts/admin")
    end

    it "redirects unauthorized user" do
      get :edit
      expect(response).to redirect_to(new_admin_sessions_path)
    end
  end

  describe "#update" do
    before do
      sign_in_admin
      create :admin_settings
    end
    it "updates valid information" do
      patch :update, admin_settings: { email: "d@email.com", site_name: "New Name" }

      expect(response).to redirect_to edit_admin_settings_path
      settings = AdminSettings.last.reload
      expect(settings.email).to eq "d@email.com"
      expect(settings.site_name).to eq "New Name"
      expect(flash[:notice]).to_not be_nil
    end

    it "does not update invalid information" do
      patch :update, admin_settings: { email: "me@email.com", site_name: "" }

      expect(flash[:alert]).to_not be_nil
    end
  end
end
