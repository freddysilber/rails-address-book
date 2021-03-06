class User < ApplicationRecord
	has_secure_password
	validates :username, uniqueness: true
	validates :username, presence: true
	has_many :accounts, :dependent => :destroy
	has_many :contacts, through: :accounts, :dependent => :destroy
	has_many :projects, through: :accounts, :dependent => :destroy
	# 3RD PARTY LOGIN (OMNIAUTH W/ GITHUB)
	def self.find_or_create_by_omniauth(auth_hash)
		self.where(:username => auth_hash["info"]["nickname"]).first_or_create do |user|
			user.password = SecureRandom.hex
		end
	end
	# GET ALL ACCOUNTS BY CURRENT USER
	def self.my_accounts(current_user_id)
		# accounts = Account.all.where(user_id == current_user_id) # WAS CAUSING BUGS UPON LOGIN
		accounts = []
		Account.all.each do |a|
			if a.user_id == current_user_id
				accounts << a
			end
		end
		accounts
		# self.accounts
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

	def self.my_projects(current_user_id)
		projects = []

		Project.all.each do |p|
			if p.account.user_id == current_user_id
				projects << p
			end
		end
		projects 
	end
end