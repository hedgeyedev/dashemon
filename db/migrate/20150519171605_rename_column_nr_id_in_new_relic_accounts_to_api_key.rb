class RenameColumnNrIdInNewRelicAccountsToApiKey < ActiveRecord::Migration
  def change
    rename_column :new_relic_accounts, :nr_id, :nr_api_key
  end
end
