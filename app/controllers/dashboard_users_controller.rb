class DashboardUsersController < ApplicationController
  before_action :authenticate_dashboard_user!
  before_action :set_dashboard_user, only: [:show]

  # GET /dashboard_users/1
  # GET /dashboard_users/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_user
      @dashboard_user = current_dashboard_user
    end
end
