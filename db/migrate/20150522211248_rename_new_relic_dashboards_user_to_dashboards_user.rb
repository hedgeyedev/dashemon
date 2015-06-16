class RenameNewRelicDashboardsUserToDashboardsUser < ActiveRecord::Migration
  def change
    rename_table :new_relic_dashboards_users, :dashboard_users
  end
end
