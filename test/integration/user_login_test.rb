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
end
