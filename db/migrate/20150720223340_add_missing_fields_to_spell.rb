class AddMissingFieldsToSpell < ActiveRecord::Migration
  def change
    add_column :spells, :range, :string
    add_column :spells, :duration, :string
    add_column :spells, :material_components, :string
  end
end
