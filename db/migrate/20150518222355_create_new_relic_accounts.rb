class CreateNewRelicAccounts < ActiveRecord::Migration
  def change
    create_table :new_relic_accounts do |t|
      t.references :new_relic_dashboard, index: true, foreign_key: true
      t.string :nr_id

      t.timestamps null: false
    end
  end
end
