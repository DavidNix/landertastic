require "spec_helper"

describe StatisticsMailer do
  include MailSpecMacros

  before do
    admin = create(:admin_settings)
    admin.email = "admin@example.com"
    admin.site_name = "Test Site"
    admin.save!
    reset_email
  end

  it "sends email" do
    StatisticsMailer.daily_stats_email.deliver

    expect(last_email).to_not be_nil
    expect(last_email.from).to include "no-reply@landertastic.com"
    expect(last_email.to).to include "admin@example.com"
    expect(last_email.subject).to eq "Daily Statistics for Test Site"
  end
end