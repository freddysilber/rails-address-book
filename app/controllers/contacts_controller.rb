class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create 
		contact = Contact.new(contact_params)
		if contact.valid?
			contact.save
			redirect_to '/contacts/show'
		else
			redirect_to '/'
		end
	end

	def show
		@contacts = Contact.all
	end

	private

	def user_params
    	params.require(:contact).permit(:first_name, :last_name, :phone_number, :email)
  	end
end
