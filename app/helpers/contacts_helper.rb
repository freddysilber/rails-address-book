module ContactsHelper
	def contact_account_id_field(contact)
		if contact.account.nil?
			select_tag "contact[account_id]", options_from_collection_for_select(Account.all.where(user_id: current_user.id), :id, :name), class: "field"
		else
			hidden_field_tag "contact[account_id]", contact.account_id
		end
	end
end