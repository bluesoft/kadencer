require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  test "the organization sitename should be unique" do

    x = Organization.new(:name => 'Junioes', :site_name => 'junioes')
    assert x.save
    
    y = Organization.new(:name => 'Junioes', :site_name => 'junioes')
    assert !y.save
  end
  
end
