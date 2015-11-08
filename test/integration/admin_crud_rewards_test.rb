require 'test_helper'

class AdminCrudRewardsTest < ActionDispatch::IntegrationTest

  test 'admin can create a new reward' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    click_link "New Reward"

    fill_in "Name", with: "Bora Bora"
    fill_in "Point Value", with: "500"
    fill_in "Description", with: 'The best vacation ever!'
    click_button "Create Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Bora Bora")
  end

  test 'admin can edit an existing reward' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    create_reward

    click_link "Edit"

    assert new_admin_reward_path, current_path

    fill_in "Point Value", with: "10"

    click_button "Update Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("10")
  end

  test 'admin can delete an existing reward' do
    skip
    login_admin

    assert page.has_content?("Admin Dashboard")

    create_reward

    click_link "Delete"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("spaige")
    refute page.has_content?("Bora Bora")
  end
end
