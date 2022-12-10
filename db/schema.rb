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

ActiveRecord::Schema[7.0].define(version: 2022_12_10_174737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_numbers", force: :cascade do |t|
    t.string "account_number"
    t.string "alias"
    t.bigint "bank_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_account_numbers_on_bank_id"
    t.index ["company_id"], name: "index_account_numbers_on_company_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "town"
    t.string "street"
    t.string "number_building"
    t.text "description"
    t.string "type"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "region_id"
    t.string "post_number"
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["region_id"], name: "index_addresses_on_region_id"
  end

  create_table "banks", force: :cascade do |t|
    t.text "bank_name"
    t.string "bik"
    t.string "correspondent_account_number"
    t.string "swift"
    t.string "iban"
    t.boolean "resident"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.text "legal_name_company"
    t.string "inn"
    t.string "kpp"
    t.string "ogrn"
    t.string "okpo"
    t.string "okved"
    t.string "full_name_director"
    t.string "phone_number"
    t.string "email"
    t.text "description"
    t.boolean "resident"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "position"
    t.string "email"
    t.string "personal_phone_number"
    t.string "work_phone_number"
    t.string "additional_phone_number"
    t.text "description"
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_company_contacts_on_contactable"
  end

  create_table "containers", force: :cascade do |t|
    t.string "name_container"
    t.decimal "length"
    t.decimal "height"
    t.decimal "width"
    t.decimal "weight"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.string "language", default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "department_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_department_products_on_department_id"
    t.index ["product_id"], name: "index_department_products_on_product_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name_department"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.date "date_birthday"
    t.string "gender"
    t.string "personal_phone_number"
    t.string "work_phone_number"
    t.integer "additional_number"
    t.text "about"
    t.string "type"
    t.bigint "department_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_item_containers", force: :cascade do |t|
    t.bigint "container_id"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "price"
    t.string "source_type"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sum"
    t.index ["container_id"], name: "index_line_item_containers_on_container_id"
    t.index ["source_type", "source_id"], name: "index_line_item_containers_on_source"
  end

  create_table "line_items", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "price"
    t.string "source_type"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.bigint "container_id"
    t.string "unit"
    t.integer "sum"
    t.index ["container_id"], name: "index_line_items_on_container_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
    t.index ["source_type", "source_id"], name: "index_line_items_on_source"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_products_on_kind_id"
  end

  create_table "receptions", force: :cascade do |t|
    t.bigint "our_company_id"
    t.bigint "supplier_id"
    t.boolean "confirmation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["our_company_id"], name: "index_receptions_on_our_company_id"
    t.index ["supplier_id"], name: "index_receptions_on_supplier_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_name"
    t.integer "distance_from_moscow_to_center_region"
    t.string "language", default: "en"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_numbers", "banks"
  add_foreign_key "account_numbers", "companies"
  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "regions"
  add_foreign_key "department_products", "departments"
  add_foreign_key "department_products", "products"
  add_foreign_key "line_item_containers", "containers"
  add_foreign_key "line_items", "containers"
  add_foreign_key "line_items", "products"
  add_foreign_key "receptions", "companies", column: "our_company_id"
  add_foreign_key "receptions", "companies", column: "supplier_id"
  add_foreign_key "regions", "countries"
end
