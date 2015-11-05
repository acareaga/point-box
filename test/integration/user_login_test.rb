require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "user can login from the root" do
    login_user

    assert page.has_content?("Welcome Shannon")
    assert page.has_content?("Points:")
    assert page.has_content?("Logout")
  end

  def login_user
    User.create(username:        "spaige",
                password:        "password",
                first_name:      "Shannon",
                last_name:       "Paige",
                top_destination: "Bora Bora")

    visit login_path
    fill_in "Username",        with: "spaige"
    fill_in "Password",        with: 'password'
    click_button "Login"
  end
end
