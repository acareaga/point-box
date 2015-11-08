class Admin::RewardsController < Admin::BaseController

  def new
    @user = User.find(params[:format])
    @reward = Reward.new
  end

  def create
    params
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "You successfuly created a reward!"
      redirect_to admin_path(params[:format])
    else

    end
  end

  def edit
  end

  def update
    if @reward.update(reward_params)
      redirect_to @reward
    else
      flash.now[:errors] = @reward.error.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    Reward.destroy(params[:id])
    redirect_to admin_path(params[:format])
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :point_value, :description, :user_id)
  end
end
