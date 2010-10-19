class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  actions :show, :new, :create
  
  def create    
    super
    @organization.users << current_user
    redirect_to root_url
  end
  
end
