require 'test_helper'

class AdminCrudRewardsTest < ActionDispatch::IntegrationTest

  test 'admin can create a new reward' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    click_link "New Reward"

    assert new_admin_reward_path, current_path

    fill_in "Name", with: "Bora Bora"
    fill_in "Point Value", with: "500"
    fill_in "Description", with: 'The best vacation ever!'
    click_button "Create Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Bora Bora")
  end
end
