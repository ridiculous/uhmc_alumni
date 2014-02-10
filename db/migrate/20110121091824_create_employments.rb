class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.string :employer
      t.string :work_address
      t.string :work_city
      t.string :work_state
      t.string :work_country
      t.integer :work_zip_code
      t.string :supervisor
      t.string :supervisor_phone
      t.string :supervisor_email
      t.string :position_held
      t.date :start_date
      t.date :end_date
      t.boolean :work_present
      t.string :job_description
      t.integer :alumni_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
