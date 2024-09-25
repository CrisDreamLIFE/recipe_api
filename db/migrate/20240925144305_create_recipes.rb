class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :portions
      t.text :preparation

      t.timestamps
    end
  end
end
