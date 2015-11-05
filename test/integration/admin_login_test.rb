require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "admin can login and see their dashboard" do
    login_admin

    assert page.has_content?("Admin Dashboard")
    assert page.has_content?("Users:")
    assert page.has_content?("Rewards:")
    assert page.has_content?("Logout")
  end

  test "a non-admin can not see the admin dashboard" do
    login_user
    visit '/admin/aaron'

    assert page.has_content?("404")
  end


end
