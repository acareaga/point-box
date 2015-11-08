class Admin::UsersController < Admin::BaseController
  def edit
    @admin = User.find(params[:admin_id])
    @user = User.find(params[:id])
  end

  def update
    @admin = User.find(params[:admin_id])
    @user = User.find(params[:id])
    @user.update(user_params)

    flash.notice = "User #{@user.username} Updated!"

    redirect_to admin_path(@admin)
  end

  def destroy
    @admin = User.find(params[:admin_id])
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
