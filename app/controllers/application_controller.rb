class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :logged_in?
	helper_method :current_user

	def logged_in?
		session[:user_id].present?
	end

	def current_user
		User.find_by(id: session[:user_id])
	end
end
