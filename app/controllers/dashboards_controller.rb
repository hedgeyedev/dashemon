class DashboardsController < ApplicationController
  before_action :authenticate_dashboard_user!
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]
  include DataTransform

  # GET /dashboards
  # GET /dashboards.json
  def index
    @dashboards = Dashboard.all
                           .paginate(:page => params[:page], :per_page => 5)
                           .order('created_at desc')
                                
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
    @airbrake_groups = transform_airbrake_data_for_view @dashboard.airbrake_charts
    @heroku_groups = transform_heroku_data_for_view @dashboard.heroku_charts
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new dashboard_params
    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    if not @dashboard.nil?
      @dashboard.assign_attributes dashboard_params
    else
      redirect_to dashboards_path, notice: "No dashboard with id = #{params[:id]} found."
    end

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_dashboard
    @dashboard = Dashboard.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dashboard_params
    params.require(:dashboard).permit(:name, 
                                      new_relic_charts_attributes: [:embedded_html, :_destroy, :id], 
                                      airbrake_charts_attributes: [:api_key, :project_id, :_destroy, :id],
                                      heroku_charts_attributes: [:api_key, :app_id_or_name, :_destroy, :id] )
  end
end
