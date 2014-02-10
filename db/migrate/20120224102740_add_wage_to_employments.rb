class AddWageToEmployments < ActiveRecord::Migration
  def self.up
    add_column :employments, :wage, :string
  end

  def self.down
    remove_column :employments, :wage
  end
end
