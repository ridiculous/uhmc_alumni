class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :school_name
      t.string :degree_name
      t.string :program_name
      t.date :date_accepted
      t.date :date_graduated
      t.string :internships
      t.string :projects
      t.integer :alumni_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
