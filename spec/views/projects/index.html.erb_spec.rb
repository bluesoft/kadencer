require 'spec_helper'

describe "projects/index.html.erb" do
  fixtures :projects
  
  it "should show all projects from all the organizations that the user belongs grouped by organization" do
        projects_map = {1 => [projects(:erp)], 2 => [projects(:pronto)]}    
        assign(:projects_map,projects_map)
        render
        rendered.should =~ /organization_1/
        rendered.should =~ /organization_2/
  end
  
  
  it "should provide a link for the user to create a new project in the organization that he owns" do
    assign(:projects_map,{})
    render
    rendered.should =~ /New Project/
  end
  
  
  
end
