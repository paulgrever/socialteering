class OrganizationsController < ApplicationController
  def index
  end
  
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organization_path(@organization)
    else
      flash[:danger] = "We couldn't locate your EIN, please try again or fill out the request form."
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:ein)
  end
end
