class WorkingDaysController < ApplicationController
  def index
  	 @working_days = WorkingDay.all
  end

   def edit
    @day = WorkingDay.find(params[:id])
  end
  
  def show
    @day = WorkingDay.find(params[:id]) 
  end
  
  def update
    @day = WorkingDay.find(params[:id])
    
    respond_to do |format|
      if @day.update(working_day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def working_day_params
    params.require(:working_day).permit(:day, :status, :start_time, :end_time)
  end  
end  
