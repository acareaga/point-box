ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end

  def create_user
    User.create(username:        "spaige",
                password:        "password",
                first_name:      "Shannon",
                last_name:       "Paige",
                top_destination: "Bora Bora")
  end

  def create_reward
    Reward.create(name: "Bora Bora",
                  point_value: "500",
                  description: "Best vacation ever!")
  end

  def login_user
    create_user

    visit login_path
    fill_in "Username",        with: "spaige"
    fill_in "Password",        with: 'password'
    click_button "Login"
  end

  def login_admin
    admin = User.create(username:        "aaron",
                        password:        "password",
                        first_name:      "Aaron",
                        last_name:       "Careaga",
                        top_destination: "Bora Bora",
                        role:             1  )

    visit login_path
    fill_in "Username",        with: "aaron"
    fill_in "Password",        with: 'password'
    click_button "Login"
  end
end
