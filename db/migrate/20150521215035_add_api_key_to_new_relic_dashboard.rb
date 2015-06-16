class AddApiKeyToNewRelicDashboard < ActiveRecord::Migration
  def change
    add_column :new_relic_dashboards, :nr_api_key, :string
  end
end
