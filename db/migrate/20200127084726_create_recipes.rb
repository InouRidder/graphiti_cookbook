class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.boolean :cooked, default: false
      t.integer :rating, default: 0
      t.text :description
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
