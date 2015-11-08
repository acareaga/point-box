class UsersController < ApplicationController

  def new
    @admin = User.find(params[:admin_id]) if params[:admin_id]
    @user = User.new
  end

  def create
    @admin = User.find(params[:admin_id]) if params[:admin_id]
    @user = User.new(user_params)
    if @user.save
      if @admin
        redirect_to admin_path(@admin)
      else
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :points_available, :points_redeemed, :top_destination)
  end
end
