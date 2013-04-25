# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130422214814) do

  create_table "patients", :force => true do |t|
    t.string   "email"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "sex"
    t.string   "dateOfBirth"
    t.string   "phoneNumber"
    t.string   "mailingAddress"
    t.string   "emergencyContactPerson"
    t.string   "emergencyContactNumber"
    t.string   "existingDiagnoses"
    t.string   "currentMedication"
    t.integer  "therapist_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "therapists", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "therapists", ["authentication_token"], :name => "index_therapists_on_authentication_token", :unique => true
  add_index "therapists", ["confirmation_token"], :name => "index_therapists_on_confirmation_token", :unique => true
  add_index "therapists", ["email"], :name => "index_therapists_on_email", :unique => true
  add_index "therapists", ["reset_password_token"], :name => "index_therapists_on_reset_password_token", :unique => true
  add_index "therapists", ["unlock_token"], :name => "index_therapists_on_unlock_token", :unique => true

end
