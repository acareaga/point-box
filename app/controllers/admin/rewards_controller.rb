class Admin::RewardsController < Admin::BaseController

  def new
    @admin = User.find(params[:admin_id])
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "You successfuly created a reward!"
      redirect_to admin_path(params[:admin_id])
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @admin = User.find(params[:admin_id])
    @reward = Reward.find(params[:id])
  end

  def update
    @admin = User.find(params[:admin_id])
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      flash.notice = "Reward #{@reward.name} Updated!"
      redirect_to admin_path(@admin)
    else
      flash.now[:errors] = @reward.error.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    @admin = User.find(params[:admin_id])
    @reward = Reward.find(params[:id])
    @reward.destroy
    flash.notice = "Reward Deleted"
    redirect_to admin_path(@admin)
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :point_value, :description, :user_id)
  end
end
