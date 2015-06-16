class CreateNewRelicDashboards < ActiveRecord::Migration
  def change
    create_table :new_relic_dashboards do |t|
      t.references :new_relic_dashboards_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
