class Admin::RewardsController < Admin::BaseController
  before_action :set_up

  def set_up
    @admin = current_user
    @reward = Reward.new
  end

  def new
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
    @reward = Reward.find(params[:id])
  end

  def update
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
