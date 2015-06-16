module DataTransform
  extend ActiveSupport::Concern

  def transform_airbrake_data_for_view(airbrake_charts)
    airbrake_groups = airbrake_charts.map do |a|
      begin
        AirbrakeAPI.get_groups a.project_id, a.api_key
      rescue HTTParty::Error => e
        nil 
      end
    end

    airbrake_groups.compact!

    airbrake_groups.each do |g|
      g.sort_by! do |e|
        [e['resolved'] ? 1 : 0, -(e['lastNoticeAt'].to_i)] 
      end
    end
  end

  def transform_heroku_data_for_view(heroku_charts)
    heroku_groups = heroku_charts.map do |h|
      begin
        HerokuAPI.get_log_session h.app_id_or_name, h.api_key
      rescue HTTParty::Error => e
        nil
      end
    end

    heroku_groups.compact!
    heroku_groups.reject!(&:empty?)

    heroku_groups
  end
end

