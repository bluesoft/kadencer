require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def setup
    @user = users(:one)

  end

  test "if the user isnt't logged then it should redirect to the login page" do

  end


  test "if the user does not have an organization we need to redirect him to the new organization page" do
    sign_in :user,  @user 
    post :index    
    #assert_redirected_to(:controller => "organization", :action => "create")
  end
  
end
