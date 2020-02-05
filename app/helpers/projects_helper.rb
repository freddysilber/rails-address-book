module ProjectsHelper
	def project_account_id_field(project)
		if project.account.nil?
			select_tag "project[account_id]", options_from_collection_for_select(Account.all.where(user_id: current_user.id), :id, :name), class: "field"
		else
			hidden_field_tag "project[account_id]", project.account_id
		end
	end
end