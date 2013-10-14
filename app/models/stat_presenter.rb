class StatPresenter
  include ActionView::Helpers::NumberHelper

  attr_reader :start_time

  def initialize(since: nil)
    @start_time = since
  end

  def total_hits
    count(Hit)
  end

  def conversion_rate
    decimal = count(Lead).to_f/count(Hit).to_f
    number_to_percentage(decimal * 100, precision: 2)
  end

  def reset
    Hit.destroy_all
  end

  private

  def count(klass)
    return klass.count if start_time.blank?
    klass.where('created_at > ?', start_time).count
  end

end