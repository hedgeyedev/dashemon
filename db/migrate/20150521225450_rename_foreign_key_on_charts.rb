class RenameForeignKeyOnCharts < ActiveRecord::Migration
  def change
    rename_column :charts, :new_relic_dashboards_id, :new_relic_dashboard_id
  end
end
