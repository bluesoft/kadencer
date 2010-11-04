class Project < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :organization
  validates_presence_of :organization_id
    
end
