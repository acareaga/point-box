require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_attributes(points = 10000)
    {
      username: "xander",
      password: "thedog",
      points_available: points
    }
  end

  def buying_reward(points = 10000)
    user = User.new(valid_attributes(points))
    reward = Reward.create(name: "Key West", point_value: "500")
    User.buy_reward(user, reward)
  end

  test "user is created with valid attributes" do
    user = User.new(valid_attributes)

    assert user.valid?
    assert_equal "xander", user.username
    assert_equal 10000, user.points_available
    assert_equal "default", user.role
  end

  test "user is not created when missing username" do
    user = User.new(valid_attributes)
    user.username = nil

    assert user.invalid?
  end

  test "user is not created when missing password" do
    user = User.new(valid_attributes)
    user.password = nil

    assert user.invalid?
  end

  test "user is not created when duplicates username" do
    user = User.create(valid_attributes)
    user2 = User.new(username: "xander", password: "password")

    assert user2.invalid?
  end

  test "user can buy a reward if they have enough points" do
    error = buying_reward

    assert_nil error
  end

  test "user can't buy a reward if they don't have enough points" do
    error = buying_reward(10)

    assert_equal "You don't have enought points for this!!!", error
  end

  test "user can't buy a reward if they don't have any points" do
    error = buying_reward(nil)

    assert_equal "You don't have any points, you can't buy anything!!!", error
  end
end
