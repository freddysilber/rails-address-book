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
	# GET ALL PROJECTS BY CURRENT USER
	# def self.my_projects
	# 	projects = []
	# 	Project.all.each do |p|
	# 		if p.account.user_id == current_user_id
	# 			projects << p
	# 		end
	# 	end
	# 	projects
	# end
	# GET ALL TASKS BY CURRENT USER
	# def self.my_tasks
	# 	tasks = []
	# 	Task.all.each do |t|
	# 		if t.project.account.user_id == current_user_id
	# 			tasks << t
	# 		end
	# 	end
	# 	tasks
	# end
end