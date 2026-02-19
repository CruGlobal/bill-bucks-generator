class AdminController < ApplicationController
  before_action :require_login

  def index
    @balances = Buck.balances_by_recipient
  end

  private

  def require_login
    return if helpers.current_user

    redirect_to login_path(return_to_url: admin_url), alert: "You must be logged in to view the admin dashboard"
  end
end
