class StatPresenter
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::DateHelper

  attr_reader :start_time

  def initialize(since: nil)
    @start_time = since
  end

  def total_hits
    count(Hit)
  end

  def total_leads
    count(Lead)
  end

  def conversion_rate
    decimal = count(Lead).to_f/count(Hit).to_f
    decimal = 0.0 if (count(Hit).to_i == 0)
    number_to_percentage(decimal * 100, precision: 2)
  end

  def began_date
    admin_start_date.strftime("%b %-d, %Y")
  end

  def running_time
    distance_of_time_in_words_to_now(admin_start_date)
  end

  private

  def count(klass)
    return klass.count if start_time.blank?
    klass.where('created_at > ?', start_time).count
  end

  def admin_start_date
    AdminSettings.first.experiment_start_date
  end
end