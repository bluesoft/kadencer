class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  actions :show, :new, :create
  
  def create
    @organization.users << User.new
  end
  
end
