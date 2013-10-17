require 'spec_helper'

describe AdminSettings do
  describe "validations" do
    it "only allows one admin record" do
      create :admin_settings
      second_settings = build :admin_settings
      expect(second_settings).to_not be_valid
    end

    it "validate emails" do
      settings = create :admin_settings
      settings.email = "valid@site.com"
      expect(settings).to be_valid

      ["notvalid", nil, " ", "#$@site..com"].each do |string|
        settings.email = string
        expect(settings).to_not be_valid
      end
    end

  end

  describe "callbacks" do
    it "sets defaults on before_create" do
      settings = described_class.new
      settings.save
      settings.reload
      expect(settings.site_name).to_not be_nil
      expect(settings.email).to_not be_nil
      expect(settings.experiment_start_date).to_not be_nil
    end
  end
end