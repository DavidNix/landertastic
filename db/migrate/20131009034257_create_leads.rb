class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :email, null: false
      t.timestamps
    end
    add_index :leads, :email
  end
end
