class User < ApplicationRecord
    has_secure_password

    before_validation {email.downcase!}
    validates :password, length: {minimum: 6}

    has_many :favourites, dependent: :destroy
    has_many :carts, dependent: :destroy
end