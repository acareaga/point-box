class User < ActiveRecord::Base
  has_secure_password
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  validates :username, presence: true, uniqueness: true
  # validates :password, presence: true

  enum role: %w(default admin)

  def self.deduct_points(id)
    @user = User.find(id)
    latest_reward_points = @user.rewards.last.point_value
    new_points = @user.points_available - latest_reward_points
    @user.update(points_available: new_points)
    @user.points_redeemed = @user.points_redeemed + latest_reward_points
  end
end
