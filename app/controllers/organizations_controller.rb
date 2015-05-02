class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
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

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      flash[:success] = "Your information has been updated"
      render :show
    else
      flash[:danger] = "Your information was not updated"
      
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:ein,
                                         :user_id,
                                         :name,
                                         :careofname,
                                         :address,
                                         :city,
                                         :state,
                                         :zipcode,
                                         :phone_number,
                                         :email,
                                         :facebook_url,
                                         :twitter_url,
                                         :website,
                                         :google_plus_url,
                                         :description)
  end
end
