class Project < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :organization
  validates_presence_of :organization_id
  
  def self.ofUser(user_id)
    Project.all(:joins => "inner join organizations_users ou on ou.organization_id = projects.organization_id and ou.user_id = #{user_id}")    
  end  
  
end
