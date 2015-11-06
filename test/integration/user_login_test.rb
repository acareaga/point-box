require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "user can login from the root" do
    login_user

    assert page.has_content?("Welcome Shannon")
    assert page.has_content?("Points:")
    assert page.has_content?("Logout")
  end
end
