# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120224105912) do

  create_table "alumnis", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mi"
    t.string   "first_name_grad"
    t.string   "last_name_grad"
    t.string   "mi_grad"
    t.string   "mailing_address"
    t.string   "mailing_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
    t.string   "secondary_address"
    t.string   "secondary_address_2"
    t.string   "secondary_city"
    t.string   "secondary_state"
    t.string   "secondary_country"
    t.integer  "secondary_zip_code"
    t.string   "email"
    t.string   "secondary_email"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "work_phone"
    t.datetime "last_logged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.boolean  "marital_status"
    t.string   "location"
    t.string   "ethnicity"
  end

  create_table "employments", :force => true do |t|
    t.string   "employer"
    t.string   "work_address"
    t.string   "work_city"
    t.string   "work_state"
    t.string   "work_country"
    t.integer  "work_zip_code"
    t.string   "supervisor"
    t.string   "supervisor_phone"
    t.string   "supervisor_email"
    t.string   "position_held"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "work_present"
    t.string   "job_description"
    t.integer  "alumni_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_details"
    t.string   "wage"
    t.boolean  "self_employed"
  end

  create_table "schools", :force => true do |t|
    t.string   "school_name"
    t.string   "degree_name"
    t.string   "program_name"
    t.date     "date_accepted"
    t.date     "date_graduated"
    t.string   "internships"
    t.string   "projects"
    t.integer  "alumni_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "completed_courses"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "salt"
    t.datetime "last_logged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.integer  "alumni_id"
  end

end
