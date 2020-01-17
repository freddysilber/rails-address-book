class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user[:id]
      redirect_to '/users/#{user.id}'
    else
      redirect_to '/'
    end
  end

  def show
    if logged_in? # is this even needed????
      @user = User.find(params[:id])
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
