class Account < ApplicationRecord
	belongs_to :user
	has_many :contacts
	has_many :projects
	has_many :tasks, through: :projects
end