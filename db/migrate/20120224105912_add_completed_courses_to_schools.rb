class AddCompletedCoursesToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :completed_courses, :string
  end

  def self.down
    remove_column :schools, :completed_courses
  end
end
