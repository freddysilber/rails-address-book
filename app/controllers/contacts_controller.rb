class ContactsController < ApplicationController	
	before_action :set_contact!, only: [:show, :edit, :update]

	def index
		@contacts = []
		Contact.all.each do |c|
			if c.account.user_id == current_user.id
				@contacts << c
			end
		end
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
		if @contact.account.user_id == current_user.id
			render 'show'
		end
	end
	
	def edit
		if @contact.account.user_id == current_user.id
			render 'edit'
		end
	end

	def update
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

	def set_contact!
		@contact = Contact.find(params[:id])
	end
end
