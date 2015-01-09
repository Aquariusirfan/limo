class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account , only: [:edit,:update,:show,:destroy]

  def index
    @accounts = current_user.company.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      params[:customer_ids].split(",").each do |id|
        AccountCustomer.create(:account_id=>@account.id,:customer_id=>id)
      end
      flash[:notice] = "Account was successfully created."
      redirect_to accounts_path
    else
      render :new
    end
  end


  #  params[:feed_tags].split(",").each do |tag_id|
  #            FeedTag.create(:tag_id => tag_id , :feed_id =>@feed.id)
  #          end

  def edit
  end

  def show
  end

  def update
    if @account.update_attributes(account_params)
      flash[:notice] = "Account was successfully updated."
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def fetch_customers
    @customers = Customer.where("LOWER(first_name) LIKE "  + "'" +params[:q].downcase.to_s + "%%'" +"")
    respond_to do |format|
      format.json { render :json => @customers.to_json }
    end
  end


  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Accounts was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def account_params
    params[:account].permit!
  end

  def set_account
    @account = Account.find(params[:id])
  end


end
