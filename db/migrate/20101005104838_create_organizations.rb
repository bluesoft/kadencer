class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :site_name
      t.timestamps
    end
    add_index :organizations, :site_name, {:unique => true}
  end

  def self.down
    drop_table :organizations
  end
end
