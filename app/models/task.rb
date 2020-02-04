class Task < ApplicationRecord
	before_validation :capitalize_name
	validates :task_name, :project_id, presence: true
	belongs_to :project

	private

	def capitalize_name
		self.task_name = self.task_name.capitalize
	end
end
