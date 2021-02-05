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

ActiveRecord::Schema.define(version: 2021_02_04_025922) do

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

  create_table "documents", force: :cascade do |t|
    t.date "expiryDate"
    t.string "documentType"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supplier_id"
    t.bigint "user_id", null: false
    t.index ["supplier_id"], name: "index_documents_on_supplier_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "receivedDate"
    t.date "dueDate"
    t.decimal "totalPrice"
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_order_id"
    t.bigint "user_id", null: false
    t.index ["purchase_order_id"], name: "index_invoices_on_purchase_order_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.date "orderDate"
    t.boolean "approvalStatus"
    t.decimal "totalPrice"
    t.boolean "delivered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supplier_id", null: false
    t.bigint "user_id", null: false
    t.index ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "qualityRating", limit: 2
    t.integer "reliabilityRating", limit: 2
    t.integer "costRating", limit: 2
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_order_id"
    t.index ["purchase_order_id"], name: "index_reviews_on_purchase_order_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "service"
    t.string "website"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_number"
    t.text "description"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "user_suppliers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "supplier_id", null: false
    t.index ["supplier_id"], name: "index_user_suppliers_on_supplier_id"
    t.index ["user_id"], name: "index_user_suppliers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "suppliers"
  add_foreign_key "documents", "users"
  add_foreign_key "invoices", "purchase_orders"
  add_foreign_key "invoices", "users"
  add_foreign_key "purchase_orders", "suppliers"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "reviews", "purchase_orders"
  add_foreign_key "suppliers", "users"
  add_foreign_key "user_suppliers", "suppliers"
  add_foreign_key "user_suppliers", "users"
end
