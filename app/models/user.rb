class User < ActiveRecord::Base
  has_secure_password
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  validates :username, presence: true, uniqueness: true

  enum role: %w(default admin)

  def self.buy_reward(user, reward)
    error = nil
    if user.points_available.nil?
      error = "You don't have any points, you can't buy anything!!!"
    elsif reward.point_value > user.points_available
      error = "You don't have enought points for this!!!"
    else
      new_points_available = user.points_available - reward.point_value
      new_redeemed_points = user.points_redeemed + reward.point_value
      user.update_attributes!(points_available: new_points_available)
      user.update_attributes!(points_redeemed: new_redeemed_points)
      user.rewards << reward
      user.save
    end
    error
  end
end
