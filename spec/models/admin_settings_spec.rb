require 'spec_helper'

describe AdminSettings do
  describe "validations" do
    it "only allows one admin record" do
      create :admin_settings
      second_settings = build :admin_settings
      expect(second_settings).to_not be_valid
    end
  end
end