require 'spec_helper'

describe "projects/edit.html.erb" do
  fixtures :projects, :organizations_users, :organizations

  before (:each) do
    @project = projects(:erp)
    assign(:project, @project)
    assign(:organization, Organization.find(1))
    render    
  end
  
  it "should show the users able to work on the project" do
        rendered.should have_selector('#users') do | users |
            @project.organization.users.each { |user|              
              rendered.should =~ /#{user.fullName}/
            }            
        end
  end
  
end
