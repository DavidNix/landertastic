class AdminSettings < ActiveRecord::Base

  validate :singleton_admin_record

  before_create :set_experiment_start_date

  private

  def set_experiment_start_date
    self.experiment_start_date = Time.now
  end

  def singleton_admin_record
    errors.add(:base, "only one admin record allowed") if admin_exceeded_records?
  end

  def admin_exceeded_records?
    self.new_record? && self.class.count > 0
  end
end
