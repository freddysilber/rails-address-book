require 'pry'
class User < ApplicationRecord
	validates :username, uniqueness: true
	validates :username, presence: true
	has_secure_password
	has_many :accounts, :dependent => :destroy
	has_many :contacts, through: :accounts, :dependent => :destroy
	has_many :projects, through: :accounts, :dependent => :destroy
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