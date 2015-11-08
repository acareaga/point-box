class AdminController < ApplicationController
  before_action :require_admin

  def show
    @admin = current_user
  end
end
