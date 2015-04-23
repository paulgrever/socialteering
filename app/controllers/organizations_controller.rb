class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:ein)
  end
end
