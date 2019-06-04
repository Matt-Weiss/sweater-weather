class User < ApplicationRecord
  has_many :favorites
  has_many :locations, through: :favorites
  has_secure_password
  has_secure_token :api_key
end
