class RewardsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @user = current_user
    @reward = Reward.find(params[:reward_id])
    # User.deduct_points(@user.id)
    # see user.rb
    if @user.points_available.nil?
      flash[:error] = "You don't have any points, you can't buy anything!!!"
    elsif @reward.point_value > @user.points_available
      flash[:error] = "You don't have enought points for this!!!"
    else
      latest_reward_points = @reward.point_value
      new_points = @user.points_available - latest_reward_points
      new_redeemed_points = @user.points_redeemed + latest_reward_points
      @user.update_attributes(points_available: new_points)
      @user.update_attributes(points_redeemed: new_redeemed_points)
      @user.rewards << @reward
      @user.save
      flash[:notice] = "You bought it!!!"
    end

    redirect_to user_path(@user)
  end
end
