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

  test 'admin can edit a reward' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    click_link "New Reward"

    fill_in "Name", with: "Vancouver"
    fill_in "Point Value", with: "500"
    fill_in "Description", with: 'The best vacation ever!'
    click_button "Create Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Vancouver")

    within("#vancouver") do
      click_link "Edit"
    end

    fill_in "Name", with: "Paris"
    fill_in "Point Value", with: "10"
    click_button "Update Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Paris")
  end

  test 'admin can delete a reward' do
    login_admin
    assert page.has_content?("Admin Dashboard")

    click_link "New Reward"

    fill_in "Name", with: "Vancouver"
    fill_in "Point Value", with: "500"
    fill_in "Description", with: 'The best vacation ever!'
    click_button "Create Reward"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Vancouver")

    within("#vancouver") do
      click_link "Delete"
    end

    assert page.has_content?("Admin Dashboard")
    refute page.has_content?("Vancouver")
  end
end
