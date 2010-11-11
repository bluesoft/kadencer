class AddFullNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :fullName, :string
  end

  def self.down
    remove_column :users, :fullName
  end
end
