class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create 
		contact = Contact.create(contact_params)
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
