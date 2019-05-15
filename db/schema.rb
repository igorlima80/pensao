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

ActiveRecord::Schema.define(version: 2019_05_08_002411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.integer "value_per_night_cents", default: 0, null: false
    t.string "value_per_night_currency", default: "BRL", null: false
    t.integer "maximum_adult"
    t.integer "maximum_child"
    t.boolean "available"
    t.integer "rating_score"
    t.float "latitude"
    t.float "longitude"
    t.bigint "property_id"
    t.bigint "type_trip_id"
    t.bigint "type_accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "fake_latitude"
    t.float "fake_longitude"
    t.index ["latitude", "longitude"], name: "index_accommodations_on_latitude_and_longitude"
    t.index ["property_id"], name: "index_accommodations_on_property_id"
    t.index ["type_accommodation_id"], name: "index_accommodations_on_type_accommodation_id"
    t.index ["type_trip_id"], name: "index_accommodations_on_type_trip_id"
  end

  create_table "accommodations_conveniences", id: false, force: :cascade do |t|
    t.bigint "accommodation_id"
    t.bigint "convenience_id"
    t.index ["accommodation_id"], name: "index_accommodations_conveniences_on_accommodation_id"
    t.index ["convenience_id"], name: "index_accommodations_conveniences_on_convenience_id"
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "number"
    t.string "complement"
    t.string "zipcode"
    t.string "district"
    t.string "street"
    t.bigint "city_id"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cancellations", force: :cascade do |t|
    t.datetime "moment"
    t.bigint "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reserve_id"], name: "index_cancellations_on_reserve_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "ibge"
    t.bigint "state_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_cities_on_latitude_and_longitude"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "conveniences", force: :cascade do |t|
    t.string "name"
    t.boolean "fixed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "security_code"
    t.string "brand"
    t.string "expiration_date"
    t.string "holder"
    t.string "card_number"
    t.bigint "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "text_transaction"
    t.string "payment_cielo_id"
    t.text "text_capture"
    t.text "return_info"
    t.integer "installments"
    t.index ["reserve_id"], name: "index_credit_cards_on_reserve_id"
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log"
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "onesignal_id"
    t.string "onesignal_permission"
    t.datetime "last_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onesignal_id"], name: "index_devices_on_onesignal_id"
    t.index ["owner_type", "owner_id"], name: "index_devices_on_owner_type_and_owner_id"
  end

  create_table "fees", force: :cascade do |t|
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.bigint "accommodation_id"
    t.bigint "type_fee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_fees_on_accommodation_id"
    t.index ["type_fee_id"], name: "index_fees_on_type_fee_id"
  end

  create_table "franchisees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "social_data"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "icon"
    t.boolean "published"
    t.integer "position"
    t.string "target"
    t.string "permission"
    t.string "permission_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_item_id"
    t.index ["menu_item_id"], name: "index_menu_items_on_menu_item_id"
  end

  create_table "payment_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "date"
    t.text "return_text"
    t.string "cielo_payment_id"
    t.bigint "payment_types_id"
    t.bigint "payment_status_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.bigint "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_status_id"], name: "index_payments_on_payment_status_id"
    t.index ["payment_types_id"], name: "index_payments_on_payment_types_id"
    t.index ["reserve_id"], name: "index_payments_on_reserve_id"
  end

  create_table "photos", force: :cascade do |t|
    t.boolean "fachada"
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_photos_on_accommodation_id"
  end

  create_table "properties", force: :cascade do |t|
    t.date "accreditation_date"
    t.date "deaccreditation_date"
    t.integer "accreditation_status"
    t.bigint "franchisee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accreditation_status"], name: "index_properties_on_accreditation_status"
    t.index ["franchisee_id"], name: "index_properties_on_franchisee_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.text "comment"
    t.integer "score"
    t.datetime "moment"
    t.bigint "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reserve_id"], name: "index_ratings_on_reserve_id"
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "number_adult"
    t.integer "number_child"
    t.integer "number_pets"
    t.date "checkin_date"
    t.date "checkout_date"
    t.datetime "cancel_date"
    t.integer "number_daily"
    t.string "protocol"
    t.integer "total_value_cents", default: 0, null: false
    t.string "total_value_currency", default: "BRL", null: false
    t.bigint "accommodation_id"
    t.uuid "guest_id"
    t.integer "reserve_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "setting_id"
    t.index ["accommodation_id"], name: "index_reserves_on_accommodation_id"
    t.index ["setting_id"], name: "index_reserves_on_setting_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "accommodation_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.boolean "include_in_daily"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_services_on_accommodation_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "percentage_of_administration"
    t.integer "percentage_of_franchisee"
    t.integer "percentage_of_property"
    t.integer "days_for_reserve_refund"
    t.integer "days_of_ticket_validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "card_cost_percentage"
    t.float "percentage_of_installments"
    t.integer "max_of_installments_without_percentage"
    t.integer "max_of_installments"
  end

  create_table "setups", force: :cascade do |t|
    t.bigint "convenience_id"
    t.bigint "accommodation_id"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_setups_on_accommodation_id"
    t.index ["convenience_id"], name: "index_setups_on_convenience_id"
  end

  create_table "special_periods", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "final_date"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "promotional"
    t.index ["accommodation_id"], name: "index_special_periods_on_accommodation_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "ibge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_accommodations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_fees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_trips", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unavailabilities", force: :cascade do |t|
    t.date "start_date"
    t.date "final_date"
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_unavailabilities_on_accommodation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userable_type"
    t.bigint "userable_id"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.string "generated_password"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable_type_and_userable_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "accommodations", "properties"
  add_foreign_key "accommodations", "type_accommodations"
  add_foreign_key "accommodations", "type_trips"
  add_foreign_key "addresses", "cities"
  add_foreign_key "cancellations", "reserves"
  add_foreign_key "cities", "states"
  add_foreign_key "credit_cards", "reserves"
  add_foreign_key "fees", "accommodations"
  add_foreign_key "fees", "type_fees"
  add_foreign_key "guests", "users"
  add_foreign_key "menu_items", "menu_items"
  add_foreign_key "payments", "payment_statuses"
  add_foreign_key "payments", "payment_types", column: "payment_types_id"
  add_foreign_key "payments", "reserves"
  add_foreign_key "photos", "accommodations"
  add_foreign_key "properties", "franchisees"
  add_foreign_key "ratings", "reserves"
  add_foreign_key "reserves", "accommodations"
  add_foreign_key "reserves", "settings"
  add_foreign_key "services", "accommodations"
  add_foreign_key "setups", "accommodations"
  add_foreign_key "setups", "conveniences"
  add_foreign_key "special_periods", "accommodations"
  add_foreign_key "unavailabilities", "accommodations"
end
