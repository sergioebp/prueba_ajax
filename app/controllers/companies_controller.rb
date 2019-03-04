class CompaniesController < ApplicationController
  def index
    @companies = Company.order(:id)
    @company = Company.new
  end

  def create
    @company = Company.new(name: params[:company][:name])
    @company.save 
    respond_to :js
  end

  def destroy  
    @company = Company.find(params[:id])
    @company.destroy 
    respond_to :js
  end

  def edit  
    @company = Company.find(params[:id])
    respond_to :js
  end

  def update
    @company = Company.find(params[:id])
    @company.name = params[:company][:name]
    @company.save
    respond_to :js
  end

  def show
    @company = Company.find(params[:id])
    @user = current_user
    @claims = Claim.where("company_id = #{@company.id}").order('created_at DESC')
    @claim = Claim.new
  end
end
