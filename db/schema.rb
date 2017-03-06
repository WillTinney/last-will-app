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

ActiveRecord::Schema.define(version: 20170227175407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignees", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "relationship"
    t.string   "citizenship"
    t.string   "date_of_birth"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "profile_picture"
    t.string   "profile_picture_seed"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_assignees_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "call_to_actions", force: :cascade do |t|
    t.string   "event"
    t.string   "event_type"
    t.datetime "release_date"
    t.boolean  "approver_confirmation"
    t.integer  "approver_count"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_call_to_actions_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "assignee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["assignee_id"], name: "index_notes_on_assignee_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "photo"
    t.string   "title"
    t.string   "caption"
    t.integer  "assignee_id"
    t.integer  "user_id"
    t.string   "photo_seed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["assignee_id"], name: "index_photos_on_assignee_id", using: :btree
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.string   "document"
    t.string   "title"
    t.string   "comments"
    t.integer  "assignee_id"
    t.integer  "user_id"
    t.string   "document_seed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignee_id"], name: "index_references_on_assignee_id", using: :btree
    t.index ["user_id"], name: "index_references_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "citizenship"
    t.string   "date_of_birth"
    t.string   "phone_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "profile_picture"
    t.string   "profile_picture_seed"
    t.boolean  "partner",                default: false
    t.integer  "number_of_children"
    t.integer  "number_of_guardians"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "data_unlocked",          default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "video"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_videos_on_user_id", using: :btree
  end

  add_foreign_key "assignees", "users"
  add_foreign_key "call_to_actions", "users"
  add_foreign_key "notes", "assignees"
  add_foreign_key "notes", "users"
  add_foreign_key "photos", "assignees"
  add_foreign_key "photos", "users"
  add_foreign_key "references", "assignees"
  add_foreign_key "references", "users"
  add_foreign_key "videos", "users"
end
