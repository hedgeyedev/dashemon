class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :embedded_html
      t.belongs_to :new_relic_dashboards, index: true
    end
  end
end
