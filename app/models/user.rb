class User < ActiveRecord::Base
	validates :first_name, :last_name, :email_address, :password, presence: true
	validates :password, length: { in: 8..20 }
	validates :email_address, uniqueness: true
end

 

 