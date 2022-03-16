require 'rails_helper'

RSpec.describe PaymentInfo, type: :model do
  describe "Validation test" do

    before do
      @user = User.create(
        name: "general user",
        email: "general_user@payment_info.com",
        address: "Baker Street 211B",
        phone: "080 1102 0689",
        password: "password")
    end

    it "is valid to add payment information" do
      payment_info = PaymentInfo.new(
        user_id: @user.id,
        card_holder: @user.name,
        card_number: "4532040475075458",
        expiration_date: "7/2024",
        cvc: "198"
      )
      expect(payment_info).to be_valid
    end

    it "is invalid to add payment information without user information" do
      payment_info = PaymentInfo.new(
        card_number: "4532040475075458",
        expiration_date: "7/2024",
        cvc: "198"
      )
      expect(payment_info).not_to be_valid
    end

    it "is invalid to add payment information without card information" do
      payment_info = PaymentInfo.new(
        user_id: @user.id,
        card_holder: @user.name,
      )
      expect(payment_info).not_to be_valid
    end
  end
end
