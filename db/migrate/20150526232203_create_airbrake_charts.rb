class CreateAirbrakeCharts < ActiveRecord::Migration
  def change
    create_table :airbrake_charts do |t|
      t.string :api_key, null: false, default: ''
      t.string :project_id, null: false, default: ''
      t.string :group_id, null: false, default: ''
      t.belongs_to :dashboards, index: true
      t.timestamps null: false
    end
  end
end
