class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :text
    add_column :users, :phone, :string
  end
end
