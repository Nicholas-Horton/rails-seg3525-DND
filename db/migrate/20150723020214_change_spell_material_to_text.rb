class ChangeSpellMaterialToText < ActiveRecord::Migration
  def change
    change_column :spells, :material_components, :text
  end
end
