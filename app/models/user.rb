class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 20 },
            uniqueness: { case_sensitive: false }
  has_many :messsages
  has_secure_password
end
