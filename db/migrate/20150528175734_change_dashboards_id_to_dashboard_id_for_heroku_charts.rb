class ChangeDashboardsIdToDashboardIdForHerokuCharts < ActiveRecord::Migration
  def change
    rename_column :heroku_charts, :dashboards_id, :dashboard_id
  end
end
