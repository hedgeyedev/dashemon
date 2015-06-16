class CreateNewRelicApps < ActiveRecord::Migration
  def change
    create_table :new_relic_apps do |t|
      t.references :new_relic_account, index: true, foreign_key: true
      t.string :nr_api_key

      t.timestamps null: false
    end
  end
end
