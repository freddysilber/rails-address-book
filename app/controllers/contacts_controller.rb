class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create 
		contact = Contact.new(contact_params)
		# contact.user_id = current_user.id
		
		if contact.valid?
			contact.save
			redirect_to "/contacts/#{contact.id}"
		else
			raise
			# redirect_to '/'
		end
		# raise params
		# @contact = Contact.new
		# @contact.first_name = params[:first_name]
		# @contact.save
		# redirect_to contact_path(@contact)

		# raise contact_params
		# raise params
		# contact = Contact.create(contact_params)
		# raise contact.valid?
		# redirect_to "/contacts/#{contact.id}"
		# raise contact_params
		# contact = Contact.new(contact_params)
		# # raise contact.valid?
		# if contact.valid?
		# 	contact.save
		# 	redirect_to "/contacts/#{contact.id}"
		# end
	end

	def show
		# @contact = Contact.find_by(id: params[:id])
		@contact = Contact.find(params[:id])
		render 'show'
	end

	private

	def contact_params
    	params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :user_id)
  	end
end
