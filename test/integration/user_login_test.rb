require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "user can login from the root" do
    login_user

    assert page.has_content?("Welcome Shannon")
    assert page.has_content?("Points:")
    assert page.has_content?("Logout")
  end

  test 'unregisted user cannot login' do
    visit login_path

    fill_in "Username", with: "Jimbo"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Login")
  end

  test 'registered user cannot login with incorrect password' do
    user = User.create(username: "Jimbo",
                       password: "pass")

    visit login_path
    fill_in "Username", with: "Jimbo"
    fill_in "Password", with: "notmypassword"
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Login")
  end

  test "users can only see their own dashboard" do
    jimbo = User.create(username: "Jimbo",
                       password: "pass", points_available: 50000)
    create_user
    login_user

    visit user_path(User.find_by(username: "Jimbo"))

    assert page.has_content?("Shannon")
  end

  test "guests can't see dashboards" do
    jimbo = User.create(username: "Jimbo",
                       password: "pass", points_available: 50000)

    visit user_path(User.find_by(username: "Jimbo"))

    assert page.has_content?("404")
  end
end
