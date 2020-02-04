module TasksHelper
	def project_id_field(task)
		if task.project.nil?
			select_tag "task[project_id]", options_from_collection_for_select(Project.all, :id, :project_name), class: "field"
		else
			hidden_field_tag "task[project_id]", task.project_id
		end
	end
end