class AirbrakeChart < ActiveRecord::Base
  belongs_to :dashboard
  validates_presence_of :api_key, :project_id
end
