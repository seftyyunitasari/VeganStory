class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true

  belongs_to :category
  has_many :favourites, dependent: :destroy
  has_many :favourite_products, through: :favourites, source: :product
  
end
