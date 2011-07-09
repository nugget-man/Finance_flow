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

ActiveRecord::Schema.define(:version => 20110708224810) do

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "customers", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "homephone"
    t.string   "cellphone"
    t.string   "fnameco"
    t.string   "lnameco"
    t.string   "emailco"
    t.string   "homephoneco"
    t.string   "cellphoneco"
    t.string   "salesman"
    t.integer  "step"
    t.boolean  "inprogress"
    t.boolean  "prelimcondmet"
    t.string   "prelimcondmetuser"
    t.integer  "exp"
    t.integer  "equ"
    t.integer  "tra"
    t.string   "createdby"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "details"
    t.string   "lender"
  end

  create_table "flowlists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flowones", :force => true do |t|
    t.integer  "flowlist_id"
    t.string   "flowlist_name"
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "stepeights", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.string   "appraisal"
    t.integer  "phone"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepelevens", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "updated_by"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepfives", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepfours", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepfourteens", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "updated_by"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepnines", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "irrelevent"
    t.boolean  "refurb"
    t.boolean  "survey"
    t.boolean  "utilities"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepones", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "downpayment"
    t.string   "loantype"
    t.string   "lender"
  end

  create_table "stepsevens", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.string   "survey"
    t.integer  "phone"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepsixes", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.string   "titlecompany"
    t.integer  "phone"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steptens", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepthirteens", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "updated_by"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stepthrees", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steptwelves", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "updated_by"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steptwos", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_fname"
    t.string   "customer_lname"
    t.string   "title"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
