class AddExperimentStartDateToAdminSettings < ActiveRecord::Migration
  def change
    add_column :admin_settings, :experiment_start_date, :datetime, null: false
  end
end
