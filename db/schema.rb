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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170106122430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approvers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "citizenship"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "country"
    t.string   "postcode"
    t.string   "relationship"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_approvers_on_user_id", using: :btree
  end

  create_table "guardians", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "citizenship"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "postcode"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "relationship"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_guardians_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "approver_id"
    t.integer  "guardian_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "owner_type"
    t.integer  "owner_id"
    t.index ["approver_id"], name: "index_notes_on_approver_id", using: :btree
    t.index ["guardian_id"], name: "index_notes_on_guardian_id", using: :btree
    t.index ["owner_type", "owner_id"], name: "index_notes_on_owner_type_and_owner_id", using: :btree
    t.index ["recipient_id"], name: "index_notes_on_recipient_id", using: :btree
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "citizenship"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "country"
    t.string   "postcode"
    t.string   "relationship"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_recipients_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "citizenship"
    t.string   "date_of_birth"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "country"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "profile_picture"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "approvers", "users"
  add_foreign_key "guardians", "users"
  add_foreign_key "notes", "approvers"
  add_foreign_key "notes", "guardians"
  add_foreign_key "notes", "recipients"
  add_foreign_key "recipients", "users"
end
