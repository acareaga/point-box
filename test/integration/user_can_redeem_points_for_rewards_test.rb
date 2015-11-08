require 'test_helper'

class UserCanRedeemPointsForRewardsTest < ActionDispatch::IntegrationTest

  test 'user can redeem points for a reward' do
    login_user
    create_reward

    visit user_path(User.find_by(username: "spaige"))

    click_link("View Rewards to Purchase")

    assert page.has_content?("Rewards:")
    within ("#paris") do
      click_link("Purchase Reward")
    end

    assert current_path, user_path(User.find_by(username: "spaige"))
    assert page.has_content?("Paris")

    assert page.has_content?("90")
  end
end
