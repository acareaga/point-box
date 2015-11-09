class Admin::UsersController < Admin::BaseController
  before_action :set_up

  def set_up
    @admin = current_user

  end

  def new
    @new_user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_path(@admin)
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash.notice = "User #{@user.username} Updated!"
    redirect_to admin_path(@admin)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.notice = "User Deleted"
    redirect_to admin_path(@admin)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :points_available, :points_redeemed, :top_destination)
  end
end
