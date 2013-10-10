class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :ip_address
      t.string :user_agent
      t.timestamps
    end
    add_index :hits, :created_at
  end
end
