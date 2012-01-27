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

ActiveRecord::Schema.define(:version => 20120117122322) do

  create_table "employee_trainings", :force => true do |t|
    t.integer  "training_id"
    t.integer  "employee_id"
    t.integer  "status"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "employee_name"
    t.integer  "emp_number"
    t.string   "project"
    t.string   "email_id"
    t.string   "skill"
    t.date     "start_date"
    t.string   "manager_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "technologies"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", :force => true do |t|
    t.string   "training_name"
    t.string   "training_id"
    t.date     "start_date"
    t.string   "trainer_name"
    t.string   "location"
    t.string   "trainer_email_id"
    t.string   "trainer_contact"
    t.string   "duration"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
