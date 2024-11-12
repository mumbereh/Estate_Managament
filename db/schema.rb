# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_20_152012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estates", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_estates_on_name", unique: true
  end

  create_table "leases", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "room_id", null: false
    t.date "start_date"
    t.decimal "monthly_rent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.index ["room_id"], name: "index_leases_on_room_id"
    t.index ["tenant_id"], name: "index_leases_on_tenant_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "lease_id", null: false
    t.decimal "amount"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.integer "months_covered"
    t.decimal "balance_carried_forward"
    t.date "start_month"
    t.date "end_month"
    t.decimal "amount_due_next_month"
    t.index ["lease_id"], name: "index_payments_on_lease_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "code"
    t.string "status_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number"
    t.decimal "price"
    t.bigint "room_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estate_id"
    t.index ["room_number"], name: "index_rooms_on_room_number", unique: true
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "home_district"
    t.string "village"
    t.string "next_of_kin"
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "estate_id", null: false
    t.index ["estate_id"], name: "index_tenants_on_estate_id"
    t.index ["room_id"], name: "index_tenants_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leases", "rooms"
  add_foreign_key "leases", "tenants"
  add_foreign_key "payments", "leases"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "tenants", "estates"
  add_foreign_key "tenants", "rooms"
end
