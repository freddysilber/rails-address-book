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
		@account = Account.new(account_params)
		@account.user_id = current_user.id
		if @account.save
			redirect_to account_path(@account)
		else
			render :new
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
		if @account.update(account_params)
			redirect_to account_path(@account)
		else
			render :edit
		end
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