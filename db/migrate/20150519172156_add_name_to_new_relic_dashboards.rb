class AddNameToNewRelicDashboards < ActiveRecord::Migration
  def change
    add_column :new_relic_dashboards, :name, :string
  end
end
