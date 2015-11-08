class Admin::UsersController < Admin::BaseController
  before_action :set_up

  def set_up
    @admin = current_user
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash.notice = "User #{@user.username} Updated!"
    redirect_to admin_path(@admin)
  end

  def destroy
    @user.destroy
    flash.notice = "User Deleted"
    redirect_to admin_path(@admin)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :points_available, :points_redeemed, :top_destination)
  end
end
