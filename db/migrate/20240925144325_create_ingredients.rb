class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.float :quantity
      t.references :measurement_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
