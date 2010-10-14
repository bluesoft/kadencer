require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @organization = organizations(:one)
    @user = users(:one)
  end

  test "should add the user to the organization" do
    sign_in @user 
    assert  user_signed_in?
    assert @user.active? == true

    
    
    #post :create, :organization => @organization.attributes
    #assert_redirected_to 'x'
    #assert_response :redirect
    #assert_template 'show'

    
    #assert assigns(:organization).valid?    
    assert @organization.users.size == 1

  end

end
