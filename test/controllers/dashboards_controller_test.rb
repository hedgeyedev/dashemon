require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @dashboard = dashboards(:one)
    sign_in DashboardUser.first
  end

  test "it should create a new dashboard" do
    assert_difference('Dashboard.count') do
      post :create, {
        :dashboard => {
          :name => 'name1',
          :new_relic_charts_attributes => [{ :embedded_html => '<p>Hi</p>' }],
          :airbrake_charts_attributes => [{ :api_key => 'api1', :project_id => 'proj 1' }]
        }
      }
    end

    assert_redirected_to dashboard_path(assigns(:dashboard))
  end

  test "it shouldn't create a new dashboard given less keys than project ids" do
    assert_no_difference('Dashboard.count') do
      post :create, {
        :dashboard => {
          :name => 'name2',
          :new_relic_charts_attributes => [{ :embedded_html => '<p>Hi</p>' }],
          :airbrake_charts_attributes => [{ :api_key => 'api1', :project_id => 'proj 1' }, { :api_key => '', :project_id => 'proj 2' }]
        }
      }
    end
    assert_response :success
  end

  test "it shouldn't create a new dashboard given less project ids than keys" do
    assert_no_difference('Dashboard.count') do
      post :create, {
        :dashboard => {
          :name => 'name3',
          :new_relic_charts_attributes => [{ :embedded_html => '<p>Hi</p>' }],
          :airbrake_charts_attributes => [{ :api_key => 'api1', :project_id => 'proj 1' }, { :api_key => 'api2', :project_id => '' }]
        }
      }
    end
    assert_response :success
  end

  test "it should edit a dashboard's new relic embedded html" do
    id = dashboards :one
    embedded_html = '<p>edit first nr chart</p>'
    api_key = 'edit first airbrake chart key'
    patch :update, { 
      :id => id,
      :dashboard => { 
        :new_relic_charts_attributes => [{ :embedded_html => embedded_html, :id => 1 }],
        :airbrake_charts_attributes => [{ :api_key => api_key, :project_id => 321, :id => 1 }],
        :name => 'edit first dashboard'
      }
    }

    assert dashboards(:one).new_relic_charts[0].embedded_html == embedded_html, 'Updating dashboard doesn\'t update new relic chart'
    assert dashboards(:one).airbrake_charts[0].api_key == api_key, 'Updating dashboard doesn\'t update airbrake api key'
  end

  test "it should delete a dashboard" do
    id = dashboards :two
    old_count = Dashboard.count
    delete :destroy, { 
      :id => id,
    }
    assert Dashboard.count == old_count - 1, 'Deleting dashboard has no effect.'
  end
end
