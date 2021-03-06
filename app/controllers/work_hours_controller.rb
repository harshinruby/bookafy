class WorkHoursController < ApplicationController
  before_action :set_work_hour, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only:[:index, :new, :create, :edit, :update]
  # GET /work_hours
  # GET /work_hours.json
  def index
    @work_hours = WorkHour.all
  end

  # GET /work_hours/1
  # GET /work_hours/1.json
  def show
  end

  # GET /work_hours/new
  def new
    @work_hour = WorkHour.new
  end

  # GET /work_hours/1/edit
  def edit
  end

  # POST /work_hours
  # POST /work_hours.json
  def create
    @work_hour = WorkHour.new(work_hour_params)

    respond_to do |format|
      if @work_hour.save
        format.html { redirect_to @work_hour, notice: 'Work hour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_hour }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_hours/1
  # PATCH/PUT /work_hours/1.json
  def update
    respond_to do |format|
      if @work_hour.update(work_hour_params)
        format.html { redirect_to @work_hour, notice: 'Work hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_hours/1
  # DELETE /work_hours/1.json
  def destroy
    @work_hour.destroy
    respond_to do |format|
      format.html { redirect_to work_hours_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_hour
      @work_hour = WorkHour.find(params[:id])
    end
    
    def set_client
      @client = Client.find(current_user.role_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_hour_params
      params.require(:work_hour).permit!
    end
end
