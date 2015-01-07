class AffiliatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_affiliate, only: [:show,:edit,:update,:destroy]

  def index
    @affiliates = Affiliate.all
  end

  def new
    @affiliate = Affiliate.new
  end

  def create
    @affiliate = Affiliate.new(affiliate_params)
    if @affiliate.save
      flash[:notice] = "Affiliate was successfully created."
      redirect_to affiliates_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @affiliate.update_attributes(affiliate_params)
      flash[:notice] = "Affiliate was successfully updated."
      redirect_to affiliates_path
    else
      render :edit
    end
  end

  def destroy
    @affiliate.destroy
    respond_to do |format|
      format.html { redirect_to affiliates_url, notice: 'Affiliates was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def affiliate_params
    params[:affiliate].permit!
  end

  def set_affiliate
    @affiliate = Affiliate.find(params[:id])
  end

end
