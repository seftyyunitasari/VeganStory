require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Validation test" do

    before do
      @user = FactoryBot.create(
        :user,
        name: "general user",
        email: "general_user@order.com",
        address: "Baker Street 211B",
        phone: "080 1102 0689",
        password: "password"
      )
    end

    it "is valid to create order" do
      order = Order.create(
        user_id: @user.id,
        total: 1000,
        receiver: @user.name,
        shipping_address: @user.address,
        phone: @user.phone,
        card_number: "4532040475075458"
      )
      expect(order).to be_valid
    end

    it "is invalid to create order without receiver information" do
      order = Order.create(
        user_id: @user.id,
        total: 1000,
        card_number: "4532040475075458"
      )
      expect(order).not_to be_valid
    end

    it "is invalid to create order without card number" do
      order = Order.create(
        user_id: @user.id,
        total: 1000,
        receiver: @user.name,
        shipping_address: @user.address,
        phone: @user.phone,
      )
      expect(order).not_to be_valid
    end
  end
end
