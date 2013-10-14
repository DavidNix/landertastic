class AdminSettings < ActiveRecord::Base

  before_create :set_experiment_start_date

  private

  def set_experiment_start_date
    self.experiment_start_date = Time.now
  end
end
