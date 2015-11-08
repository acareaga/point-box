require 'test_helper'

class AdminCrudUsersTest < ActionDispatch::IntegrationTest

  test 'admin can create a new user' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    click_link "New User"

    fill_in "Username", with: "spaige"
    fill_in "Password", with: 'password'
    fill_in "First name", with: "Shannon"
    fill_in "Last name", with: "Paige"
    fill_in "Top destination", with: "Bora Bora"
    fill_in "Points", with: 1000
    click_button "Create Account"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("spaige")
  end

  test 'admin can edit a user' do
    create_user
    login_admin

    assert page.has_content?("Admin Dashboard")

    within("#spaige") do
      click_link "Edit User"
    end

    fill_in "Username", with: "newusername"
    fill_in "Password", with: 'newpassword'
    fill_in "First name", with: "NewFirst"
    fill_in "Last name", with: "NewLast"
    fill_in "Top destination", with: "NewDestination"
    fill_in "Points", with: 50000
    click_button "Update Account"

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("newusername")
  end

  test 'admin can create delete a user' do
    create_user
    login_admin

    assert page.has_content?("Admin Dashboard")

    within("#spaige") do
      click_link "Delete User"
    end

    assert page.has_content?("Admin Dashboard")
    refute page.has_content?("spaige")
  end
end
