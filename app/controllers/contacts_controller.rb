class ContactsController < ApplicationController	
	def index
		@contacts = Contact.all
		@contact = self.new
	end

	def new
		@contact = Contact.new
	end

	def create 
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.valid?
			contact.save
			redirect_to "/contacts"
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
