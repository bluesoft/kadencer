require 'spec_helper'

describe ProjectsController do

  describe 'the projects index' do
    fixtures :users
    
    it 'the current user should be able to see only projects of the organizations that he belongs to' do
      @user = users(:one)
      sign_in @user            
      Project.should_receive(:of_user).once.with(1).and_return([Project.new, Project.new])      
      get :index      
      response.should render_template("projects/index")
      assigns[:projects].size.should == 2
    end
    
  end

end
