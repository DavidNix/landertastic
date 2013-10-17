class AddMoreSettingsToAdminSettings < ActiveRecord::Migration
  def change
    add_column :admin_settings, :site_name, :string, default: "Landertastic Change Me In Settings"
    add_column :admin_settings, :email, :string, default: "change_me@example.com"
  end
end