class Project < ApplicationRecord
	belongs_to :account
	# has_one :user
	# has_many :tasks

	# belongs_to :user, through: :owner??
end
