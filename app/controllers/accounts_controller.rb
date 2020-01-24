class AccountsController < ApplicationController
	def index
		@accounts = Account.all
		@account = self.new
	end

	def new
		@account = Account.new
	end

	def create
		account = Account.new(account_params)
		account.user_id = current_user.id
		account.name = account_params[:name].capitalize

		if account.valid?
			account.save
			redirect_to "/accounts"
		else
			raise
		end
	end

	def show
		@account = Account.find(params[:id])
		render 'show'
	end

	def edit
		@account = Account.find(params[:id])
		render 'edit'
	end

	def update
		@account = Account.find(params[:id])
		@account.update(account_params)
		redirect_to account_path(@account)
	end

	def destroy
		Account.find(params[:id]).destroy
		redirect_to '/accounts'
	end

	private

	def account_params
		params.require(:account).permit(
			:name,
			# :contact_id,
			:user_id,
			:phone_number,
			:active,
			:account_type
		)
	end
end