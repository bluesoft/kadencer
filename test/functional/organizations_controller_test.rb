require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @organization = organizations(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should add the user to the organization" do
    post :create, :organization => @organization.attributes
    assert assigns(:organization).valid?
    assert assigns(:organization).users.size == 1, 'The organization was not associated to current user'
    assert_redirected_to(:controller => "home")
  end

end
