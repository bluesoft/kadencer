class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  actions :show, :new
  
  def create    
     @organization = Organization.new(params[:organization])
     @organization.users << current_user
     @organization.owner = current_user

      respond_to do |format|
        if @organization.save
          format.html { redirect_to root_url }
        else
          format.html { render :action => "new" }
        end
      end
  end
  
end
