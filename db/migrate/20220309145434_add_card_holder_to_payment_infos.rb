class AddCardHolderToPaymentInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_infos, :card_holder, :string
  end
end
