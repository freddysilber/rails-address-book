class Task < ApplicationRecord
	belongs_to :project

	TASK_STATUS = [
		'Open',
		'In Progress',
		'Complete'
	]

	def self.task_statuses
		TASK_STATUS
	end
end
