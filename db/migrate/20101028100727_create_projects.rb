class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.boolean :has_iterations
      t.timestamps
    end
    add_column :projects, :organization_id, :integer, :references => :organizations
  end

  def self.down
    drop_table :projects
    remove_column :projects, :organization_id
  end
end
