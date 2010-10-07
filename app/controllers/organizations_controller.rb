class OrganizationsController < InheritedResources::Base
  respond_to :html
  actions :show, :new, :create  
end
