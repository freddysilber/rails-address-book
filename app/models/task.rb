class Task < ApplicationRecord
	validates :task_name, presence: true
	validates :project_id, presence: true
	belongs_to :project
end
