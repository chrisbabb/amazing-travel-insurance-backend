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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_230721) do
  create_table "additional_covereds", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "relationship"
    t.integer "age"
    t.integer "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "phone"
    t.string "email"
    t.string "link"
    t.integer "sub_affiliates_id"
    t.integer "policies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policies_id"], name: "index_affiliates_on_policies_id"
    t.index ["sub_affiliates_id"], name: "index_affiliates_on_sub_affiliates_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "last_four"
    t.string "exp_day"
    t.string "exp_year"
    t.string "cvv"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password"
    t.string "password_confirmation"
    t.string "address"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "province"
    t.integer "home_phone"
    t.integer "mobile_phone"
    t.string "dob"
    t.integer "age"
    t.string "billing_address"
    t.string "billing_address_two"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_postal_code"
    t.integer "credit_cards_id"
    t.integer "policies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_cards_id"], name: "index_customers_on_credit_cards_id"
    t.index ["policies_id"], name: "index_customers_on_policies_id"
  end

  create_table "policies", force: :cascade do |t|
    t.integer "policy_number"
    t.string "purchase_date"
    t.string "start_date"
    t.string "end_date"
    t.integer "additional_covereds_id"
    t.integer "product_id"
    t.integer "affiliate_id"
    t.integer "sub_affiliate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_covereds_id"], name: "index_policies_on_additional_covereds_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_total"
    t.integer "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_affiliates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "phone"
    t.string "email"
    t.string "link"
    t.integer "affiliate_id"
    t.integer "policies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policies_id"], name: "index_sub_affiliates_on_policies_id"
  end

end
