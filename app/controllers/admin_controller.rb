class AdminController < ApplicationController
  before_action :require_admin

  def show
    @user = User.find_by(username: params[:username])
  end
end
