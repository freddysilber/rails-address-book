class SessionsController < ApplicationController
	def create
		if auth_hash = request.env["omniauth.auth"]
			#logged in wit guthub

			# raise auth_hash.inspect
			# request.env["omniauth.auth"]["email"]

			# user = User.find_by(:username => params[:username])
			oauth_username = request.env["omniauth.auth"].info.nickname
			# raise oauth_username.inspect
			# raise request.env["omniauth.auth"].inspect
			if user = User.find_by(:username => oauth_username)
			# THIS user exist just log them in
				session[:user_id] = user.id
				redirect_to "/users/#{user.id}"
			else
				# I know who the person is but this is the first time theyve come to our application
				user = User.new(:username => oauth_username)
				# raise user.inspect
				if user.save
					session[:user_id] = user.id
					redirect_to "/users/#{user.id}"
				else
					raise user.errors.full_messages
				end
			end
		else
			# normal login w/ username and password
			user = User.find_by(:username => params[:username])
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to "/users/#{user.id}"
			else
				render 'sessions/new'
			end
		end

		# user = User.find_by(params[:id])
		# return head(:forbidden) unless user.authenticate(params[:password])
		# session[:user_id] = user.id
		# redirect_to "/users/#{user.id}"
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