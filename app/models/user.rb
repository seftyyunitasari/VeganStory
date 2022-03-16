class User < ApplicationRecord
    has_secure_password

    before_validation {email.downcase!}

    validates :name, presence: true
    validates :email, presence: true
    validates :address, presence: true
    validates :phone, presence: true
    validates :password, length: {minimum: 6}

    has_many :favourites, dependent: :destroy
    has_many :carts, dependent: :destroy

end