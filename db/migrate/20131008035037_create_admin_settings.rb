class CreateAdminSettings < ActiveRecord::Migration
  def change
    create_table :admin_settings do |t|
      t.datetime :last_sign_in
      t.integer :failed_attempts, default: 0, null: false
    end
  end
end
