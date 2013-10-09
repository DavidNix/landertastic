require 'spec_helper'

describe Lead do
  describe "validations" do

    it "accepts valid emails" do
      expect(
          Lead.new(email: "test@example.com")
      ).to be_valid
    end

    it "does not accept invalid or missing emails" do
      expect(
          Lead.new(email: "test@example")
      ).to_not be_valid

      expect(
          Lead.new(email: "david")
      ).to_not be_valid

      expect(
          Lead.new(email: "")
      ).to_not be_valid
    end

    it "does not allow duplicates" do
      Lead.create(email: "test@example.com")
      expect(
          Lead.new(email: "test@example.com")
      ).to_not be_valid
    end
  end
end
