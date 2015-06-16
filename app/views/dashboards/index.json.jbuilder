json.array!(@new_relic_dashboards) do |new_relic_dashboard|
  json.extract! new_relic_dashboard, :id, :new_relic_dashboards_user_id
  json.url new_relic_dashboard_url(new_relic_dashboard, format: :json)
end
