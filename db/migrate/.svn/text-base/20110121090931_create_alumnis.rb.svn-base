class CreateAlumnis < ActiveRecord::Migration
  def self.up
    create_table :alumnis do |t|
      t.string :first_name
      t.string :last_name
      t.string :mi
      t.string :first_name_grad
      t.string :last_name_grad
      t.string :mi_grad
      t.string :mailing_address
      t.string :mailing_address_2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.string :secondary_address
      t.string :secondary_address_2
      t.string :secondary_city
      t.string :secondary_state
      t.string :secondary_country
      t.integer :secondary_zip_code
      t.string :email
      t.string :secondary_email
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone
      t.datetime :last_logged
      t.timestamps
    end
  end

  def self.down
    drop_table :alumnis
  end
end
