require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def setup
    @user = users(:one)
    sign_in :user,  @user 
  end

  test "if the user isnt't logged then it should redirect to the login page" do
    sign_out @user
    @user.organizations.clear
    post :index    
    assert_redirected_to("/users/sign_in")
  end

  test "if the user does not have an organization we need to redirect him to the new organization page" do
    post :index    
    assert_redirected_to(:controller => "organizations", :action => "new")
  end
  
  test "if the users does not have a project it should show a message with a link to new project page" do
    @user.projects.clear
    post :index    
  end
  
end
