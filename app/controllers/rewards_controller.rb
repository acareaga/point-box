class RewardsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @user = current_user
    @reward = Reward.find(params[:reward_id])
    error_message = User.buy_reward(@user, @reward)
    if error_message.nil?
      flash[:notice] = "You bought it!!!"
    else
      flash[:error] = error_message
    end
    redirect_to user_path(@user)
  end
end
