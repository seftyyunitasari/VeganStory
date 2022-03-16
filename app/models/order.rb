class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  validates :receiver, presence: true
  validates :phone, presence: true
  validates :shipping_address, presence: true
  validates :card_number, presence: true
  
end
