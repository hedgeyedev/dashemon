class AddAppIdToNewRelicDashboard < ActiveRecord::Migration
  def change
    add_column :new_relic_dashboards, :nr_app_id, :string
  end
end
