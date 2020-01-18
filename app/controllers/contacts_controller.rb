class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
		redirect_to "contacts/index"
	end

	def new
		@contact = Contact.new
	end

	def create 
		# raise contact_params
		raise params
		contact = Contact.create(contact_params)
		raise contact.valid?
		redirect_to "/contacts/#{contact.id}"
		# raise contact_params
		# contact = Contact.new(contact_params)
		# # raise contact.valid?
		# if contact.valid?
		# 	contact.save
		# 	redirect_to "/contacts/#{contact.id}"
		# end
	end

	def show
		@contact = Contact.find_by(id: params[:id])
	end

	private

	def contact_params
    	params.require(:contact).permit(:first_name, :last_name, :phone_number, :email)
  	end
end
