module AirbrakeAPI
  def self.get_groups(project_id, api_key)
    groups_api = AirbrakeAPI::GroupsAPI.new api_key

    begin
      groups = groups_api.get_groups project_id
    rescue HTTParty::Error => e
      msg = "Error while trying to access Airbrake API with api key #{api_key}: #{e.message}"
      Rails.logger.debug msg
      raise e
    end
  end
  
  class GroupsAPI 
    attr_reader :api_base_url, :api_url, :query_params

    def initialize(api_key)
      @api_base_url = URI.join 'https://airbrake.io/', 'api/'
      @api_url = URI.join @api_base_url, 'v4/', 'projects/'
      @query_params = { :key => api_key }
    end

    def get_groups(project_id)
      url = URI.join @api_url, "#{project_id}/", 'groups'

      begin
        res = HTTParty.get url, query: @query_params 
        groups = JSON.parse res.body
        groups['groups']
      rescue HTTParty::Error => e
        raise e
      end
    end
  end
end
