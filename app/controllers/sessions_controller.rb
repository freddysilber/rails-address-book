class SessionsController < ApplicationController
	def create
		user = User.find_by(params[:id])
		return head(:forbidden) unless user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to "/users/#{user.id}"
	end

	def destroy
		session.delete :user_id
		redirect_to '/'
		# redirect_to login_path # ??
	end

	def new
		@users = User.all
	end
end
