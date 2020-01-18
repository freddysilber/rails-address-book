class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create 
		contact = Contact.new(contact_params)
		if contact.valid?
			contact.save
			redirect_to "/contacts/#{contact.id}"
		else
			raise
		end
	end

	def show
		@contact = Contact.find(params[:id])
		render 'show'
	end

	private

	def contact_params
    	params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :user_id)
  	end
end
