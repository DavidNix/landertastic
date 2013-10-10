require 'spec_helper'

describe StatGenerator do

  subject { StatGenerator }

  before do
    5.times { |i| create(:hit, created_at: i.days.ago) }
    create(:lead)
  end

  describe "#total_hits" do
    it "calculates total hits since the beginning" do
      expect(subject.new.total_hits).to eq 5
    end

    it "calculates total hits since a time range" do
      expect(subject.new(since: 25.hours.ago).total_hits).to eq 2
    end
  end

  describe "#conversion_ratio" do
    it "calculates expected percentage since the beginning" do
      expect(subject.new.conversion_rate).to eq "20.00%"
    end

    it "calculates expected percentage since a time range" do
      expect(subject.new(since: 25.hours.ago).conversion_rate).to eq "50.00%"
    end
  end

  describe "#reset" do
    it "destroys all hits" do
      subject.new.reset
      expect(Hit.count).to eq 0
      expect(Lead.count).to eq 1
    end
  end
end