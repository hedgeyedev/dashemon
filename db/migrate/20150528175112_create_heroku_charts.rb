class CreateHerokuCharts < ActiveRecord::Migration
  def change
    create_table :heroku_charts do |t|
      t.string :api_key, null: false
      t.string :app_id_or_name, null: false
      t.belongs_to :dashboards, index: true
      t.timestamps null: false
    end
  end
end
