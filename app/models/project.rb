class Project < ActiveRecord::Base

  validates_presence_of :name, :has_iterations
  belongs_to :organization
  validates_presence_of :organization_id
    
end
