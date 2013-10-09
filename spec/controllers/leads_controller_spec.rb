require 'spec_helper'

describe LeadsController do

  describe "#create" do
    it "creates new lead" do
      expect {
        post :create, lead: { email: "test@example.com" }
      }.to change(Lead, :count).by(1)
      expect(Lead.last.email).to eq "test@example.com"
    end

    it "only allows permitted params" do
      expect {
        post :create, lead: { created_at: Time.now }
      }.to change(Lead, :count).by(0)
    end
  end
end
