module ContactsHelper
	def account_id_field(contact)
		if contact.account.nil?
			select_tag "contact[account_id]", options_from_collection_for_select(Account.all, :id, :name)
		else
			hidden_field_tag "contact[account_id]", contact.account_id
		end
	end
end