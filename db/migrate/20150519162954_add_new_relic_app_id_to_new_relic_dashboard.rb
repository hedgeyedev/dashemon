class AddNewRelicAppIdToNewRelicDashboard < ActiveRecord::Migration
  def change
    add_reference :new_relic_apps, :new_relic_dashboard, index: true
  end
end
