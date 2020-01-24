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

	private

	def account_params
		params.require(:account).permit(
			:name,
			# :contact_id,
			# :user_id,
			# :phone_number,
			# :active,
			# :type
		)
	end
end