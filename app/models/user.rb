class User < ApplicationRecord
    # from bcrypt
    has_secure_password
    has_many :posts
    has_many :blogs
end
