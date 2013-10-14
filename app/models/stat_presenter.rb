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
    #first_date = Hit.order('created_at asc').first.try(:created_at)
    #first_date.to_s || "No hit recorded yet."
  end

  def running_time
    #distance_of_time_in_words_to_now(began_date)
  end

  private

  def count(klass)
    return klass.count if start_time.blank?
    klass.where('created_at > ?', start_time).count
  end
end