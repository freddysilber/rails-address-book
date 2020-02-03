require 'pry'
class AccountsController < ApplicationController
	before_action :set_account!, only: [:show, :edit, :update]

	def index
		@accounts = Account.where(user_id: current_user.id)
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
		if @account.user_id == current_user.id
			render 'show'
		end
	end
	
	def edit
		if @account.user_id == current_user.id
			render 'edit'
		end
	end

	def update
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
			:account_type,
			:active,
			:name,
			:phone_number,
			:user_id
		)
	end

	def set_account!
		@account = Account.find(params[:id])
	end
end