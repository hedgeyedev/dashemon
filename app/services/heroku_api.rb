module HerokuAPI

  def self.get_log_session_url(app_id_or_name, api_key)
    heroku = PlatformAPI.connect_oauth api_key

    begin
      url = heroku.log_session.create app_id_or_name, { :dyno =>  'web.1', :lines => 10, :source => 'app', :tail => false }
      url = URI.parse url['logplex_url']
    rescue Excon::Error::NotFound => e
      raise e
    end
  end


  def self.get_log_session(app_id_or_name, api_key)
    begin 
      url = get_log_session_url app_id_or_name, api_key
      res = HTTParty.get url
      #res = Net::HTTP.get_response url
      res.body
    rescue HTTParty::Error => e
      msg = "Error while trying to access Heroku API with api key #{api_key}: #{e.message}"
      Rails.logger.debug msg
      raise e
    end
  end
end
