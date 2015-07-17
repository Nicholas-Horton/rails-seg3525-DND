class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :name
      t.integer :armor_class
      t.integer :hitpoints
      t.integer :speed
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.string :saving_throw
      t.string :damage_immunities
      t.string :condition_immunities
      t.string :senses
      t.string :languages
      t.float :challenge_rating
      t.integer :experience
      t.string :description

      t.timestamps
    end
  end
end
