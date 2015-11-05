class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.username)
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :top_destination)
  end
end
