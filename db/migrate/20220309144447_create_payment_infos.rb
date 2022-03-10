class CreatePaymentInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_number
      t.string :expiration_date
      t.string :cvc

      t.timestamps
    end
  end
end
