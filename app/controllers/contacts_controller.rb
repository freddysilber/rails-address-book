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
		contact.first_name = contact_params[:first_name].capitalize
		contact.last_name = contact_params[:last_name].capitalize
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

	def edit
		@contact = Contact.find_by(id: params[:id])
		redirect_to '/contacts/edit'
	end

	def destroy
		Contact.find(params[:id]).destroy
		redirect_to "/contacts"
	end

	private

	def contact_params
    	params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :user_id)
  	end
end
