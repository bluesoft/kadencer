class Organization < ActiveRecord::Base
  
    has_and_belongs_to_many :users
    belongs_to :owner, :foreign_key => "owner", :class_name => "User"
    
    validates_presence_of :name, :site_name, :owner
    validates_uniqueness_of :site_name, :case_sensitive => false    
  
end
