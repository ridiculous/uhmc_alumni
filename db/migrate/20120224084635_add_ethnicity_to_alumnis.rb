class AddEthnicityToAlumnis < ActiveRecord::Migration
  def self.up
    add_column :alumnis, :ethnicity, :string
  end

  def self.down
    remove_column :alumnis, :ethnicity
  end
end
