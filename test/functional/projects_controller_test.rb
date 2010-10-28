require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
     @user = users(:one)
     sign_in @user
   end

  test 'only the organization owner can create a project' do    
      project = projects(:erp)
      post :create, :project => project.attributes
      assert_equal 'Only the organization owner can create a project', flash[:alert]
      assert_response :error      
  end

end