require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test "guest can create a login" do
    visit new_user_path

    fill_in "Username", with: "spaige"
    fill_in "Password", with: 'password'
    fill_in "First name", with: "Shannon"
    fill_in "Last name", with: "Paige"
    fill_in "Top destination", with: "Bora Bora"
    click_button "Create Account"

    assert_equal "/users/spaige", current_path
    assert page.has_content?("Welcome Shannon")
    assert page.has_content?("Points: 100")
  end
end
