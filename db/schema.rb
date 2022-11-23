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

ActiveRecord::Schema[7.0].define(version: 2022_11_22_193554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_addresses", force: :cascade do |t|
    t.string "post_nubmer"
    t.string "country"
    t.string "region"
    t.string "town"
    t.string "street"
    t.string "number_building"
    t.text "description"
    t.string "type"
    t.string "addressabable_type"
    t.bigint "addressabable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressabable_type", "addressabable_id"], name: "index_company_addresses_on_addressabable"
  end

  create_table "company_contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "position"
    t.string "email"
    t.string "personal_phone_number"
    t.string "work_phone_number"
    t.string "additional_phone_number"
    t.string "contactabable_type"
    t.bigint "contactabable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactabable_type", "contactabable_id"], name: "index_company_contacts_on_contactabable"
  end

  create_table "company_non_residents", force: :cascade do |t|
    t.text "legal_name_company"
    t.bigint "inn"
    t.bigint "kpp"
    t.bigint "ogrn"
    t.bigint "okpo"
    t.string "okved"
    t.bigint "account_number"
    t.bigint "correspondent_account_number"
    t.string "bank_name"
    t.integer "bic"
    t.string "full_name_director"
    t.string "phone_number"
    t.string "email"
    t.string "type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_company_non_residents_on_user_id"
  end

  create_table "company_residents", force: :cascade do |t|
    t.text "legal_name_company"
    t.bigint "account_number"
    t.bigint "correspondent_account_number"
    t.text "bank_name"
    t.integer "bic"
    t.string "sqift"
    t.string "iban"
    t.string "full_name_director"
    t.string "phone_number"
    t.string "email"
    t.string "type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_company_residents_on_user_id"
  end

  create_table "container_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "container_id"
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["container_id"], name: "index_container_products_on_container_id"
    t.index ["product_id"], name: "index_container_products_on_product_id"
  end

  create_table "containers", force: :cascade do |t|
    t.string "name_container"
    t.string "description"
    t.decimal "price"
    t.decimal "length"
    t.decimal "height"
    t.decimal "width"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "delivery_order_id"
    t.bigint "order_id"
    t.bigint "driver_id"
    t.bigint "logistic_manager_id"
    t.decimal "rate"
    t.text "comments"
    t.date "data_delivery"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_order_id"], name: "index_deliveries_on_delivery_order_id"
    t.index ["driver_id"], name: "index_deliveries_on_driver_id"
    t.index ["logistic_manager_id"], name: "index_deliveries_on_logistic_manager_id"
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "delivery_company_address_id"
    t.date "wished_date_deliver"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_company_address_id"], name: "index_delivery_orders_on_delivery_company_address_id"
    t.index ["order_id"], name: "index_delivery_orders_on_order_id"
  end

  create_table "department_products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name_department"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.date "date_bithday"
    t.string "personal_phone_number"
    t.string "work_phone_number"
    t.integer "additional_number"
    t.text "about"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.bigint "user_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "entrances", force: :cascade do |t|
    t.bigint "entrancable_supplier_id"
    t.bigint "entrancable_item_id"
    t.decimal "quantity"
    t.decimal "entrance_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrancable_item_id"], name: "index_entrances_on_entrancable_item_id"
    t.index ["entrancable_supplier_id"], name: "index_entrances_on_entrancable_supplier_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.string "itematable_type"
    t.bigint "itematable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itematable_type", "itematable_id"], name: "index_line_items_on_itematable"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_packagings", force: :cascade do |t|
    t.bigint "container_id"
    t.bigint "product_id"
    t.bigint "supply_manager_id"
    t.bigint "warehouse_worker_id"
    t.decimal "quality_container"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["container_id"], name: "index_order_packagings_on_container_id"
    t.index ["product_id"], name: "index_order_packagings_on_product_id"
    t.index ["supply_manager_id"], name: "index_order_packagings_on_supply_manager_id"
    t.index ["warehouse_worker_id"], name: "index_order_packagings_on_warehouse_worker_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "payed", default: false
    t.boolean "ready_to_delivery", default: false
    t.boolean "sent", default: false
    t.boolean "documents_was_recieved", default: false
    t.string "status"
    t.text "comment"
    t.string "orderable_type"
    t.bigint "orderable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_orders_on_contact_id"
    t.index ["orderable_type", "orderable_id"], name: "index_orders_on_orderable"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "discount", default: 0
    t.text "description"
    t.bigint "kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_products_on_kind_id"
  end

  create_table "quality_products", force: :cascade do |t|
    t.bigint "entrence_id"
    t.bigint "product_id"
    t.decimal "quality_products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrence_id"], name: "index_quality_products_on_entrence_id"
    t.index ["product_id"], name: "index_quality_products_on_product_id"
  end

  create_table "users", force: :cascade do |t|
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

end
