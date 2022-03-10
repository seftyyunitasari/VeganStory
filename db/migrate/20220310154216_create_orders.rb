class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total
      t.text :shipping_address
      t.string :card_number

      t.timestamps
    end
  end
end
