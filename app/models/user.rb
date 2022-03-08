class User < ApplicationRecord
    has_secure_password

    before_validation {email.downcase!}
    validates :password, length: {minimum: 6}

end