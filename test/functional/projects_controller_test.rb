require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test 'if the user is not the organization owner he cant create a project' do    
      @user = users(:two)
      sign_in @user
      project = projects(:erp)
      post :create, :project => project.attributes, :organization_id => 1
      assert_equal 'Only the organization owner can create a project', flash[:alert]
  end
  
  test 'only the organization owner can create a project' do
      @user = users(:one)
      sign_in @user
      project = projects(:erp)
      post :create, :project => project.attributes, :organization_id => 1
      assert_response :success
  end
  
  test 'the current user should be able to see only projects of the organizations that he belongs to' do    
    @user = users(:one)
    sign_in @user
    get :index
    Project.expects(:of_user).with(1).returns([Project.new(:id => 1), Project.new(:id => 2)])
    assert_response :success    
    assert_not_nil assigns(:projects)    
    #assert assigns(:projects).size == 2
  end
  
  test "index should show all projects from all the organizations that the user belongs grouped by organization" do
  end
  
  test "index should provide a link for the user to create a new project in the organization that he owns" do
    
  end
  
end