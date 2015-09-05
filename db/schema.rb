# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150905104947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_events", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.boolean  "successful"
    t.text     "message"
    t.text     "backtrace"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id",                            null: false
    t.string   "type",                               null: false
    t.string   "email",                              null: false
    t.string   "username",                           null: false
    t.string   "password",                           null: false
    t.string   "secret_question",                    null: false
    t.string   "secret_answer",                      null: false
    t.string   "family_name",                        null: false
    t.string   "given_name_1",                       null: false
    t.string   "given_name_2"
    t.string   "given_name_3"
    t.string   "other_names"
    t.string   "preferred_title"
    t.string   "other_title"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "country_of_birth"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "suburb"
    t.string   "city"
    t.string   "province"
    t.string   "zipcode"
    t.string   "country"
    t.string   "phone_daytime"
    t.string   "phone_night"
    t.string   "phone_mobile"
    t.string   "fax"
    t.string   "passport_number"
    t.date     "passport_expiry_date"
    t.string   "identification_type"
    t.date     "identification_issued_date"
    t.date     "identification_expiry_date"
    t.string   "industry"
    t.string   "occupation"
    t.string   "renal_dialysis"
    t.string   "tuberculosis"
    t.string   "cancer"
    t.string   "heart_disease"
    t.string   "disability"
    t.string   "hospitalisation"
    t.string   "residential_care"
    t.string   "pregnant"
    t.text     "medical_conditions"
    t.string   "tuberculosis_risk"
    t.string   "imprisionment_of_5_years_or_more"
    t.string   "imprisionment_of_12_months_or_more"
    t.string   "removal_order"
    t.string   "deported"
    t.date     "deportion_date"
    t.string   "deportion_country"
    t.string   "charged"
    t.string   "convicted"
    t.string   "under_investigation"
    t.string   "excluded"
    t.string   "removed"
    t.text     "exclude_removal_details"
    t.string   "previous_whv_permit"
    t.string   "sufficient_funds"
    t.date     "intended_travel_date"
    t.date     "intended_leave_date"
    t.string   "length_of_stay"
    t.string   "been_to_nz_before"
    t.date     "when_in_nz_date"
    t.string   "sufficient_funds_for_onward_ticket"
    t.string   "read_requirements"
    t.string   "application_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
