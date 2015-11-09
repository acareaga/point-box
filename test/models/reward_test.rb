require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: "Paris",
      point_value: 500
    }
  end

  test "reward is created with valid attributes" do
    reward = Reward.new(valid_attributes)

    assert reward.valid?
    assert_equal "Paris", reward.name
    assert_equal 500, reward.point_value
  end

  test "reward is not created when missing name" do
    reward = Reward.new(valid_attributes)
    reward.name = nil

    assert reward.invalid?
  end

  test "reward is not created when missing point value" do
    reward = Reward.new(valid_attributes)
    reward.point_value = nil

    assert reward.invalid?
  end
end
