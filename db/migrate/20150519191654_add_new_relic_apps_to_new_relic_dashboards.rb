class AddNewRelicAppsToNewRelicDashboards < ActiveRecord::Migration
  def change
    add_reference :new_relic_dashboards, :new_relic_app, index: true, foreign_key: true
  end
end
