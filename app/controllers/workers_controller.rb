class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create, :edit]
  #before_filter :trial_expired?
  # GET /workers
  # GET /workers.json
  def index
    @client_workers = @user.workers
    @team_leaders = @user.team_leaders
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.build_user
  end

  # GET /workers/1/edit
  def edit
    @services = @user.services
    p "****#{@services.count}*******"
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = @user.workers.create(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worker }
      else
        format.html { render action: 'new' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end
    
    def set_user
      if current_user.role_type == "Client"
        @user = Client.find(current_user.role_id)
      elsif current_user.role_type == "TeamLeader"
        @user = TeamLeader.find(current_user.role_id)
      else
        "ID not found"
      end    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit!
    end
end
