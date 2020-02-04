class Project < ApplicationRecord
	before_validation :capitalize_name
	validates :account_id, :project_name, presence: true
	belongs_to :account
	has_many :tasks, :dependent => :destroy

	private

	def capitalize_name
		self.project_name = self.project_name.capitalize
	end
end
