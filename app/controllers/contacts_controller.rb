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
		contact.first_name = contact_params[:first_name].capitalize
		contact.last_name = contact_params[:last_name].capitalize
		if contact.valid?
			contact.save
			redirect_to '/contacts'
		else
			raise
		end
	end

	def show
		@contact = Contact.find(params[:id])
		render 'show'
	end

	def edit
		@contact = Contact.find(params[:id])
		render 'edit'
	end

	def update
		@contact = Contact.find(params[:id])
		@contact.update(contact_params)
		redirect_to contact_path(@contact)
	end

	def destroy
		Contact.find(params[:id]).destroy
		redirect_to '/contacts'
	end

	private

	def contact_params
    	params.require(:contact).permit(
			:account_id,
			:email, 
			:first_name, 
			:last_name, 
			:phone_number
		)
  	end
end
