class DropGroupIdFromAirbrakeCharts < ActiveRecord::Migration
  def change
    remove_column :airbrake_charts, :group_id
  end
end
