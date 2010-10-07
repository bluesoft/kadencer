class CreateUsersAndOrganizationsJoin < ActiveRecord::Migration

  def self.up
    create_table 'users_organizations', :id => false do |t|
      t.column 'user_id', :integer
      t.column 'organization_id', :integer
    end
  end

  def self.down
    drop_table 'users_organizations'
  end
  
end
