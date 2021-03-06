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

ActiveRecord::Schema.define(version: 20170726131830) do

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_managers_on_username", unique: true
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "ticket_id", null: false
    t.text "text", null: false
    t.bigint "author_id"
    t.string "new_status_id"
    t.bigint "new_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "fk_rails_995937c106"
    t.index ["new_owner_id"], name: "fk_rails_6fcc381042"
    t.index ["new_status_id"], name: "fk_rails_deb6472fa9"
    t.index ["ticket_id"], name: "fk_rails_1a0b99fe7e"
  end

  create_table "statuses", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "customer_name", null: false
    t.string "customer_email", null: false
    t.string "department", null: false
    t.string "subject", null: false
    t.text "body", null: false
    t.bigint "owner_id"
    t.string "status_id", null: false
    t.string "reference", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "fk_rails_939b990649"
    t.index ["reference"], name: "index_tickets_on_reference", unique: true
    t.index ["status_id"], name: "fk_rails_7868b69687"
  end

  add_foreign_key "messages", "managers", column: "author_id"
  add_foreign_key "messages", "managers", column: "new_owner_id"
  add_foreign_key "messages", "statuses", column: "new_status_id"
  add_foreign_key "messages", "tickets"
  add_foreign_key "tickets", "managers", column: "owner_id"
  add_foreign_key "tickets", "statuses"
end
