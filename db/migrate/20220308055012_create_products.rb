class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :stock
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
