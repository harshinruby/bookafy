class CustomersController < ApplicationController
  #before_filter :load_client, only: [:create]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :create]

  # GET /customers
  # GET /customers.json
  def index
    #@customers = Customer.order(:first_name).search(params[:search])
    @customers = @client.customers.order(:first_name).search(params[:search])
    respond_to do |format|
    format.html
    #format.csv { render text: @customers.to_csv }
    format.xls 
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    #@client = Client.find_by_business_name!(request.subdomain)
    @customer = Customer.new
    @customer.appointments.build
  end

  def import
    Customer.import(params[:file], current_user.role_id)
    redirect_to root_url, notice: "Customers imported."
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = @client.customers.create(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    def set_client
      if user_signed_in?
      @client = Client.find(current_user.role_id)
      else
      @client = Client.find_by_business_name!(request.subdomain)
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit!
    end
end
