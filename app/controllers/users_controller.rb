class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def create
    # raise params
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user[:id]
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
