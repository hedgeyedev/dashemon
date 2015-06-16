class RenameNewRelicDashboardIdToDashboardId < ActiveRecord::Migration
  def change
    rename_column :charts, :new_relic_dashboard_id, :dashboard_id
  end
end
