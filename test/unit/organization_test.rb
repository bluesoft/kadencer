require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  setup do
     @user = users(:one)
     sign_in @user
   end
  
  test "the organization sitename should be unique" do

    x = Organization.new(:name => 'Junioes', :site_name => 'junioes')
    assert x.save
    
    y = Organization.new(:name => 'Junioes', :site_name => 'junioes')
    assert !y.save
  end
  
end
