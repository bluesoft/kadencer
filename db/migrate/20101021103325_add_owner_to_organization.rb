class AddOwnerToOrganization < ActiveRecord::Migration
  def self.up
     add_column :organizations, :owner, :integer, :references => :users
  end

  def self.down
    remove_column :organizations, :owner
  end
end
