class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  actions :show, :new, :edit
  
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
  
  def edit
    @organization = Organization.find(params[:id])
    if @organization.owner.id == current_user.id then      
      respond_to do |format|       
         format.html { render :action => "edit" }
       end
     else
       flash[:alert] = 'Only the organization owner can edit the organization'
       redirect_to "/projects"
    end    
  end
  
end
