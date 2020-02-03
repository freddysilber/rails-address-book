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
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contact_path(@contact)
		else
			render :new
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
		if @contact.update(contact_params)
			redirect_to contact_path(@contact)
		else
			render :edit
		end
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
