# NOTE:
# since this app uses the embedded charts HTML we don't really need to use this module
# however in the future you may need to use it, so I'm keeping it around
# there could be more exception handling here but other than that it works.

module NewRelicAPI
  def self.get_app_name(app_id, api_key)
    app_api = NewRelicAPI::ApplicationsAPI.new api_key
    name = app_api.get_app_name(app_id)
  end

  def self.format_nr_datetime(dt)
    dt.utc.strftime("%Y-%m-%dT%k:%M:%S%:z")
  end
  
  class ApplicationsAPI
    attr_reader :api_key, :api_base_url, :api_url

    def initialize(api_key)
      @api_base_url = URI.join 'https://api.newrelic.com/', 'v2/'
      @api_url = URI.join @api_base_url, 'applications/'
      @headers = { 'x-api-key' => api_key }
    end

    def get_app_info(app_id)
      url = URI.join @api_url, "#{app_id}.json/"
      res = HTTParty.get url, headers: @headers
      info = JSON.parse res.body
      info['application']
    end

    def get_app_metric_names(app_id)
      url = URI.join @api_url, "#{app_id}/", 'metrics/', 'data.json/' 
      res = HTTParty.get url, headers: @headers
      info = JSON.parse res.body
      info['metrics']
    end

    # PASS ONLY ONE NAME
    def get_app_metrics(app_id, name, values)
      url = URI.join @api_url, "#{app_id}/", 'metrics/', 'data.json/' 
      
      query = { 'names[]' => name, 'values[]' => values }
      res = HTTParty.post url, { :body => query, :headers => @headers }
      metrics = JSON.parse res.body

      if metrics['error'].nil?
        transformed_data = {}
        metrics['metric_data']['metrics'].each do |m|
          name = m['name']
          timeslices = m['timeslices']
          transformed_data[name.to_s] = timeslices
        end

        transformed_data
      else
        throw metrics['error']['title']
      end
    end

    def get_app_name(app_id)
      get_app_info(app_id)['name']
    end

    def get_app_health(app_id)
      get_app_info(app_id)['health_status']
    end

    def get_app_summary(app_id)
      get_app_info(app_id)['application_summary']
    end
  end
end
