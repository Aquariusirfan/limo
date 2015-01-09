class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer , only: [:edit,:update,:destroy]

  def index
    @customers = current_user.company.customers
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      AccountCustomer.create(:account_id=>params[:account_id],:customer_id=>@customer.id)
      flash[:notice] = "customer was successfully created."
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      flash[:notice] = "customer was successfully updated."
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'customers was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def customer_params
    params[:customer].permit!
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
