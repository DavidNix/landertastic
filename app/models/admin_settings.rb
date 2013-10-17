class AdminSettings < ActiveRecord::Base
  include SharedValidatable

  validate :singleton_admin_record
  validates :site_name, presence: true

  before_create :set_defaults

  private


  def singleton_admin_record
    errors.add(:base, "only one admin record allowed") if admin_exceeded_records?
  end

  def admin_exceeded_records?
    self.new_record? && self.class.count > 0
  end

  def set_defaults
    self.email = "change_me_in_settings@example.com"
    self.site_name = "Change Me in Settings"
    self.experiment_start_date = Time.now
  end
end
