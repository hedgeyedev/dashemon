class HerokuChart < ActiveRecord::Base
  belongs_to :dashboard
  validates_presence_of :api_key, :app_id_or_name
end
