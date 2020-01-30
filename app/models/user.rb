require 'pry'
class User < ApplicationRecord
	has_secure_password
	has_many :accounts
	has_many :contacts, through: :accounts
	has_many :projects, through: :accounts
	# GET ALL ACCOUNTS BY CURRENT USER
	def self.my_accounts(current_user_id)
		accounts = []
		Account.all.each do |a|
			if a.user_id == current_user_id
				accounts << a
			end
		end
		accounts
	end	
	# GET ALL CONTACTS BY CURRENT USER
	def self.my_contacts(current_user_id)
		contacts = []
		Contact.all.each do |c|
			if c.account.user_id == current_user_id
				contacts << c
			end
		end
		contacts
	end
end