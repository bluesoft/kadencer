require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
     
  test 'Project.ofUser should return only the projects that the user belongs' do    
    assert Project.of_user(1).first == projects(:erp)
    assert Project.of_user(2).first == projects(:pronto)
  end
  
  
end