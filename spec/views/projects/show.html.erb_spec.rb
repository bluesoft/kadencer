require 'spec_helper'

describe "projects/show.html.erb" do
  fixtures :projects, :organizations_users

  before (:each) do
    @project = projects(:erp)
    assign(:project, @project)
    render    
  end
  
  it "should show the organization name" do
        rendered.should have_selector('#organization') do | organization |
          organization.should contain @project.organization.name
        end
  end
  
  it "should show the users able to work on the project" do
        rendered.should have_selector('#users') do | users |
            @project.organization.users.each { |user|              
              rendered.should =~ /#{user.fullName}/
            }            
        end
  end
  
end
