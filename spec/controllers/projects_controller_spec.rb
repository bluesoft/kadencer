require 'spec_helper'

describe ProjectsController do

  describe 'the projects index' do
    fixtures :users, :projects, :organizations        
    
    pending 'the user should not delete a project of an organization that he does not own'
    
    it 'the current user should be able to see only projects of the organizations that he belongs to' do
      sign_in(users(:one))
      Project.should_receive(:of_user).once.with(1).and_return([projects(:erp),projects(:pronto)])
      get :index      
      response.should render_template("projects/index")
      assigns[:projects_map].should_not be_nil      
    end    
    
    it 'should send a map with projects grouped by organization to the view' do
      sign_in(users(:one))
      Project.should_receive(:of_user).and_return([projects(:erp),projects(:pronto)])
      get :index      
      response.should render_template("projects/index")
      assigns[:projects_map].size.should == 2
      assigns[:projects_map][1].size.should == 1
      assigns[:projects_map][2].size.should == 1
    end
    
    it 'if the user is not the organization owner he cant create a project' do    
        sign_in(users(:two))
        project = projects(:erp)
        post :create, :project => project.attributes, :organization_id => 1
        flash[:alert].should == 'Only the organization owner can create a project'
    end

    it 'only the organization owner can create a project' do
        sign_in(users(:one))
        project = projects(:erp)
        post :create, :project => project.attributes, :organization_id => 1
        assert_response :success
    end
    
  end

end
