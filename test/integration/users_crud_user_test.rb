require 'test_helper'

class UsersCrudUserTest < ActionDispatch::IntegrationTest
  test 'user can edit a user' do
    create_user
    login_user

    assert page.has_content?("Welcome")

    click_link "Edit Account"

    fill_in "Username", with: "newusername"
    fill_in "Password", with: 'newpassword'
    fill_in "First name", with: "NewFirst"
    fill_in "Last name", with: "NewLast"
    fill_in "Top destination", with: "NewDestination"
    click_button "Update Account"

    assert page.has_content?("newusername")
  end

  test 'user can create delete a user' do
    create_user
    login_user

    assert page.has_content?("Welcome")

    click_link "Delete Account"

    assert page.has_content?("TravelPoints")
    refute page.has_content?("Welcome")
  end
end
