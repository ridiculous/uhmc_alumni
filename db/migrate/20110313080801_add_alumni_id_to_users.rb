class AddAlumniIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :alumni_id, :integer
  end

  def self.down
    remove_column :users, :alumni_id
  end
end
