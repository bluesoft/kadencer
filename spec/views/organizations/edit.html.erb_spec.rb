require 'spec_helper'

describe "organizations/edit.html.erb" do
  fixtures :organizations, :organizations_users

  before (:each) do
    @organization = organizations(:one)
    assign(:organization, @organization)
    render    
  end
  
  it "should show the organization name" do
        rendered.should have_selector('#organization') do | organization |
          organization.should contain @organization.name
        end        
  end
  
  it "should show the users able to work on the project" do
        rendered.should have_selector('#users') do | users |
            @organization.users.each { |user|              
              rendered.should =~ /#{user.fullName}/
            }            
        end
  end
  
end
