class User < ApplicationRecord
    # from bcrypt
    has_secure_password
    has_many :posts
    has_many :blogs
    has_many :post_likes
end
