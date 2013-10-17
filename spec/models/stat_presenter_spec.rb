require 'spec_helper'

describe StatPresenter do

  subject { StatPresenter }

  def create_data
    5.times { |i| create(:hit, created_at: i.days.ago) }
    create(:lead)
  end

  describe "#total_hits" do
    before { create_data }
    it "calculates total hits since the beginning" do
      expect(subject.new.total_hits).to eq 5
    end

    it "calculates total hits since a time range" do
      expect(subject.new(since: 25.hours.ago).total_hits).to eq 2
    end
  end

  describe "#total_leads" do
    before { create_data }
    it "calculates leads since the beginning" do
      2.times { create(:lead) }
      expect(subject.new.total_leads).to eq 3
    end

    it "calculates leads since a time range" do
      create(:lead, created_at: 1.week.ago)
      expect(subject.new(since: 25.hours.ago).total_leads).to eq 1
    end
  end

  describe "#conversion_ratio" do
    context "without data" do
      it "returns 0%" do
        expect(subject.new.conversion_rate).to eq "0.00%"
      end
    end

    context "with data" do
      before { create_data }
      it "calculates expected percentage since the beginning" do
        expect(subject.new.conversion_rate).to eq "20.00%"
      end

      it "calculates expected percentage since a time range" do
        expect(subject.new(since: 25.hours.ago).conversion_rate).to eq "50.00%"
      end
    end
  end

  describe "#began date" do
    it "calculates expected began date" do
      date = "Oct 1 2013".to_date
      admin = create(:admin_settings)
      admin.experiment_start_date = date
      admin.save

      expect(subject.new.began_date.to_date).to eq date
    end
  end

  describe "#running_time" do
    it "calculates running time" do
      admin = create(:admin_settings)
      admin.experiment_start_date = 1.week.ago
      admin.save

      expect(subject.new.running_time).to eq "7 days"
    end
  end
end