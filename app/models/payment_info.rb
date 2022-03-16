class PaymentInfo < ApplicationRecord
  belongs_to :user

  validates :card_holder, presence: true
  validates :card_number, presence: true
  validates :expiration_date, presence: true
  validates :cvc, presence: true

end
