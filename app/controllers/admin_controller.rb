class AdminController < ApplicationController
  before_action :require_admin

  def show
    @admin= User.find(params[:id])
  end
end
