class RenameColumnNrApiKeyInNewRelicAppsToNrAppId < ActiveRecord::Migration
  def change
    rename_column :new_relic_apps, :nr_api_key, :nr_app_id
  end
end
