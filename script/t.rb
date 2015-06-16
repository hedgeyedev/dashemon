a = NewRelicAPI::ApplicationsAPI.new '1bbdcee21969d8b14a1a9807ae04537d154b86109d5ad51'
puts a.get_app_info 119298
puts a.get_app_metrics 119298, 'ActiveRecord/all', ['average_response_time', 'call_count']

