class ChangeDashboardsIdToDashboardId < ActiveRecord::Migration
  def change
    rename_column :airbrake_charts, :dashboards_id, :dashboard_id
  end
end
