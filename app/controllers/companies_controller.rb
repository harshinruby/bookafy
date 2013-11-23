class CompaniesController < ApplicationController
  before_filter :load_client
  #before_action :set_client, only: [:show, :create, :update] 
  
  def show
  	#@client = Client.find_by_business_name!(request.subdomain)
    @appointment = Appointment.new
  	@appointment.build_customer
  end

  def new
  	@appointment = Appointment.new
    @appointment.build_customer
   
    customer = @client.customers.build
    customer.appointments.build
  end

  def create
    @appointment = @client.appointments.create(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'show' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end	

private

  def appointment_params
      params.require(:appointment).permit!
  end
  
end
