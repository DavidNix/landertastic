namespace :stats do
  desc "Send an email of statistics from the last 24 hours"
  task :daily => :environment do
    StatisticsMailer.daily_stats_email.deliver
  end
end