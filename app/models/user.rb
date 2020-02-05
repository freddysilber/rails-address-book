require 'pry'
class User < ApplicationRecord
	validates :username, uniqueness: true
	validates :username, presence: true
	has_secure_password
	has_many :accounts, :dependent => :destroy
	has_many :contacts, through: :accounts, :dependent => :destroy
	has_many :projects, through: :accounts, :dependent => :destroy
	# 3RD PARTY LOGIN (OMNIAUTH W/ GITHUB)
	def self.find_or_create_by_omniauth(auth_hash)
		oauth_username = auth_hash["info"]["nickname"]
		if user = User.find_by(:username => oauth_username)
			# session[:user_id] = user.id
			# redirect_to "/users/#{user.id}"
			return user
		else
			# user_password = SecureRandom.hex
			user = User.create(:username => oauth_username, :password => SecureRandom.hex)
			# return user
			# if user.save
			# 	return user
			# 	# session[:user_id] = user.id
			# 	# redirect_to "/users/#{user.id}"
			# else
			# 	render 'sessions/new'
			# end
		end
	end
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