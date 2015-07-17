class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :campaign_id
      t.string :name

      t.timestamps
    end
  end
end
