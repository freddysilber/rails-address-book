class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user[:id]
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		@user = User.find_by(id: current_user.id)
		@my_accounts = User.my_accounts(current_user.id)
		@my_contacts = User.my_contacts(current_user.id)
		@my_project = User.my_projects(current_user.id)
		if current_user == @user
			render 'show'
		else 
			redirect_to '/'
		end
	end

	private 

	def user_params
		params.require(:user).permit(
			:username,
			:password
		)
	end
end
