class UsersController < ApplicationController
  before_action :require_current_user, only: [:show]

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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash.notice = "#{@user.username} Updated!"
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.error.full_messages.join(" ,")
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :points_available, :points_redeemed, :top_destination)
  end
end
