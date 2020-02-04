require 'securerandom'
class SessionsController < ApplicationController
	def create
		if auth_hash = request.env["omniauth.auth"]
			oauth_username = request.env["omniauth.auth"]["info"]["nickname"]
			if user = User.find_by(:username => oauth_username)
				session[:user_id] = user.id
				redirect_to "/users/#{user.id}"
			else
				user_password = SecureRandom.hex
				@user = User.new(:username => oauth_username, :password => user_password)
				if @user.save
					session[:user_id] = @user.id
					redirect_to "/users/#{@user.id}"
				else
					render 'sessions/new'
				end
			end
		else
			user = User.find_by(:username => params[:username])
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to "/users/#{user.id}"
			else
				render 'sessions/new'
			end
		end
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