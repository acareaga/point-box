require 'test_helper'

class AdminCrudUsersTest < ActionDispatch::IntegrationTest

  test 'admin can create a new user' do
    login_admin

    assert page.has_content?("Admin Dashboard")

    click_link "New User"

    assert new_user_path, current_path

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
end
