class RenameNewRelicDashboardsUserIdToDashboardUserId < ActiveRecord::Migration
  def change
    rename_column :dashboards, :new_relic_dashboards_user_id, :dashboard_user_id
  end
end
