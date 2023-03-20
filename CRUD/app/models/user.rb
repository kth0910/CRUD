class User < ApplicationRecord
    
	has_secure_password
	
	validates :identifier, presence: true, uniqueness: true
	validates :nickname, presence: true, uniqueness: true
end