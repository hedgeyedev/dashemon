class Dashboard < ActiveRecord::Base
  belongs_to :new_relic_dashboards_user
  has_many :new_relic_charts
  has_many :airbrake_charts
  has_many :heroku_charts
  accepts_nested_attributes_for :new_relic_charts, :airbrake_charts, :heroku_charts
  validates_presence_of :name
end
