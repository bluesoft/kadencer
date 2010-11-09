require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test 'if the user is not organization owner he cant create a project' do    
      @user = users(:two)
      sign_in @user
      project = projects(:erp)
      post :create, :project => project.attributes
      assert_equal 'Only the organization owner can create a project', flash[:alert]
  end
  
  test 'only the organization owner can create a project' do
      @user = users(:one)
      sign_in @user
      project = projects(:erp)
      post :create, :project => project.attributes
      assert_response :success
  end
  
  test 'the current user should be able to see only projects of the organizations that he belongs to' do
    
  end
  
  test "index should show all projects from all the organizations that the user belongs grouped by organization" do
        
  end
  
  test "index should provide a link for the user to create a new project in the organization that he owns" do
    
  end
  
end