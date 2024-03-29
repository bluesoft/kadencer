require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  test "the organization sitename should be unique" do
    x = Organization.new(:name => 'Junioes', :site_name => 'junioes', :owner => users(:one))
    assert x.save
    
    y = Organization.new(:name => 'Junioes', :site_name => 'junioes', :owner => users(:one))
    assert !y.save
  end
  
  test "the organization owner should not be null" do    
    x = Organization.new(:name => 'Parmalat', :site_name => 'parmalat', :owner => nil)
    assert !x.save
  end

  test "should return only the organizations of the owner" do
    x = Organization.of_owner(1)
    assert organizations(:one) == x
  end
end
