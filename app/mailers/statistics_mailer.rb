class StatisticsMailer < ActionMailer::Base

  def daily_stats_email
    @total_statistics = StatPresenter.new
    @daily_statistics = StatPresenter.new(since: 24.hours.ago)
    mail(
        from: "no-reply@landertastic.com",
        to: admin_email,
        subject: "Daily Statistics for #{site_name}"
    )
  end

  private

  def admin_email
    AdminSettings.first.email
  end

  def site_name
    AdminSettings.first.site_name
  end
end
