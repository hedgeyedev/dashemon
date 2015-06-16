class ChangeChartsToNrCharts < ActiveRecord::Migration
  def change
    rename_table :charts, :new_relic_charts
  end
end
