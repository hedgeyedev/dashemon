class RenameNewRelicDashboardsToDashboards < ActiveRecord::Migration
  def change
    rename_table :new_relic_dashboards, :dashboards
  end
end
