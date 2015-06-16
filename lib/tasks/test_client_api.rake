namespace :test_client_api do
  desc "quickly test the clientside heroku api"
  task heroku: :environment do
    l = HerokuAPI.get_log_session 'hedgeye-billing-engine', '4d551a99-f3bb-4b1f-8fcc-913023c1376d'
    puts l
  end

  desc "quickly test the clientside new relic api"
  task new_relic: :environment do
    d = NewRelicAPI.get_app_name 119298, '1bbdcee21969d8b14a1a9807ae04537d154b86109d5ad51'
    puts d
  end

  desc "quickly test the clientside airbrake api"
  task airbrake: :environment do
    g = AirbrakeAPI.get_groups 90686, '81b849900f036a282db1d58827f8a254235a9c62'
    puts g
  end

end
