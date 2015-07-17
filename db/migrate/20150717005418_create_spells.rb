class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.string :spell_class
      t.integer :level
      t.string :school
      t.boolean :ritual
      t.string :casting_time
      t.string :components
      t.boolean :concentration
      t.string :source

      t.timestamps
    end
  end
end
