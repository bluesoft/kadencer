require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @organization = Organization.new(:name => "Pedreira", :site_name => "pedreira")
    @user = users(:one)
    sign_in @user
  end

  test "should add the user to the organization and set him as the owne r" do
    post :create, :organization => @organization.attributes
    assert assigns(:organization).valid?
    assert assigns(:organization).owner == @user
    assert assigns(:organization).users.size == 1, 'The organization was not associated to current user'
    assert_redirected_to(:controller => "home")
  end
  
  test 'the project owner should be able to add the new users to the project ' do
    fail
  end
  

end
