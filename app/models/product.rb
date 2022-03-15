class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true

  belongs_to :category

  has_many :favourites, dependent: :destroy
  has_many :favourite_users, through: :favourites, source: :user

  has_many :carts, dependent: :destroy
  has_many :cart_users, through: :carts, source: :user

  has_many :comments, dependent: :destroy
end
