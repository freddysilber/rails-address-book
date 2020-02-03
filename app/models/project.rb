class Project < ApplicationRecord
	validates :account_id, presence: true
	validates :project_name, presence: true
	belongs_to :account
	has_many :tasks, :dependent => :destroy
end
