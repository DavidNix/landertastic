require 'spec_helper'

describe LeadsController do
  describe "#create" do
    it "creates new lead" do
      expect {
        post :create, lead: { email: "test@example.com" }
      }.to change(Lead, :count).by(1)
      expect(response).to be_success
      expect(Lead.last.email).to eq "test@example.com"
    end

    it "returns non-success response for invalid data" do
      post :create, lead: { email: "not valid" }

      expect(response.status).to eq 422
    end

    it "only allows permitted params" do
      expect {
        post :create, lead: { created_at: Time.now }
      }.to change(Lead, :count).by(0)
    end

    it "does not save duplicate leads" do
      Lead.create(email: "test@example.com")
      expect {
        post :create, lead: { email: "test@example.com" }
      }.to change(Lead, :count).by(0)
    end
  end

  describe "#index" do
    it "sends a text file of leads" do
      3.times { |i| create(:lead, email: "#{i}@test.com") }
      get :index

      expect(response).to be_success
      expect(response.content_type).to eq "text/plain"
      expect(response.headers['Content-Disposition']).to match /attachment; filename=\"leads-.+\.txt\"/

      expect(response.body).to eq "0@test.com\n1@test.com\n2@test.com"
    end
  end
end
