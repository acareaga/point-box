class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.role == "admin"
        redirect_to admin_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end
end
