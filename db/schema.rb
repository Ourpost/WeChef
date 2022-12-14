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

ActiveRecord::Schema.define(version: 2023_01_05_144940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "classifications", force: :cascade do |t|
    t.string "name"
    t.bigint "store_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delete_at"], name: "index_classifications_on_delete_at"
    t.index ["store_id"], name: "index_classifications_on_store_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string "name"
    t.integer "seat_amount"
    t.bigint "store_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial_number"
    t.index ["delete_at"], name: "index_desks_on_delete_at"
    t.index ["store_id"], name: "index_desks_on_store_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "note"
    t.string "photo"
    t.datetime "delete_at"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id"
    t.integer "classification_id"
    t.index ["delete_at"], name: "index_menus_on_delete_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "serial"
    t.integer "amount"
    t.string "email"
    t.jsonb "items", default: [], null: false
    t.datetime "pay_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "desk_id", null: false
    t.bigint "user_id", null: false
    t.datetime "deleted_at"
    t.string "aasm_state"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
    t.index ["desk_id"], name: "index_orders_on_desk_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.string "address"
    t.string "business_hours_start"
    t.string "business_hours_end"
    t.datetime "delete_at"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.datetime "business_start"
    t.datetime "business_end"
    t.time "time_start"
    t.time "time_end"
    t.index ["delete_at"], name: "index_stores_on_delete_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "classifications", "stores"
  add_foreign_key "desks", "stores"
  add_foreign_key "orders", "desks"
  add_foreign_key "orders", "users"
end
