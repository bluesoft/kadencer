class CreateOrganizationsAndUsersJoin < ActiveRecord::Migration

  def self.up
    create_table 'organizations_users', :id => false do |t|
      t.column 'organization_id', :integer
      t.column 'user_id', :integer      
    end
  end

  def self.down
    drop_table 'organizations_users'
  end
  
end
