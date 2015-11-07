require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "admin can login and see their dashboard" do
    login_admin

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Users:")
    assert page.has_content?("Rewards:")
    assert page.has_content?("Logout")
  end

  test "admin cannot login with incorrect password" do
    admin = User.create(username:        "aaron",
                         password:        "password",
                         first_name:      "Admin",
                         last_name:       "McGee",
                         top_destination: "Bora Bora",
                         role:             1)

    visit login_path
    fill_in "Username",        with: "aaron"
    fill_in "Password",        with: 'incorrect_password'
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
  end

  test "a non-admin cannot access the admin dashboard" do
    admin = User.create(username:        "aaron",
                        password:        "password",
                        first_name:      "Admin",
                        last_name:       "McGee",
                        top_destination: "Bora Bora",
                        role:             0)
    login_user

    visit admin_path(admin)

    assert page.has_content?("404")
  end
end
