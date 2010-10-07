class Organization < ActiveRecord::Base
  
    has_and_belongs_to_many :users
    
    validates_presence_of :name, :site_name
  
end
