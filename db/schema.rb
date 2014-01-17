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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140116045056) do

  create_table "batches", :force => true do |t|
    t.integer "beer_id"
    t.text    "name"
    t.text    "description"
    t.text    "notes"
    t.text    "label_url"
    t.integer "rating"
    t.integer "original_gravity", :default => 9999
    t.integer "final_gravity",    :default => 9999
    t.date    "brew_date"
    t.date    "secondary_date"
    t.date    "bottling_date"
    t.integer "user_id"
  end

  create_table "batches_fermentables", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "fermentable_id"
    t.integer  "quantity"
    t.text     "unit_measure"
    t.integer  "minutes_in_boil"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "batches_fermentables", ["batch_id", "fermentable_id"], :name => "index_batches_fermentables_on_batch_id_and_fermentable_id"

  create_table "batches_hops", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "hop_id"
    t.float    "quantity"
    t.text     "unit_measure"
    t.integer  "minutes_in_boil"
    t.float    "alpha_acid"
    t.float    "beta_acid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "batches_hops", ["batch_id", "hop_id"], :name => "index_batches_hops_on_batch_id_and_hop_id"

  create_table "batches_specialties", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "specialty_id"
    t.integer  "quantity"
    t.text     "unit_measure"
    t.integer  "minutes_in_kettle"
    t.text     "purpose"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "batches_specialties", ["batch_id", "specialty_id"], :name => "index_batches_specialties_on_batch_id_and_specialty_id"

  create_table "batches_yeasts", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "yeast_id"
    t.integer  "quantity"
    t.text     "unit_measure"
    t.boolean  "starter"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "batches_yeasts", ["batch_id", "yeast_id"], :name => "index_batches_yeasts_on_batch_id_and_yeast_id"

  create_table "beers", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "regional_style_id"
    t.text     "beer_style"
    t.text     "color"
    t.integer  "original_gravity",  :default => 9999
    t.integer  "time_to_make"
    t.string   "time_unit"
    t.text     "image_url"
    t.text     "country_style"
    t.text     "recipe_link"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "beerstyles", :force => true do |t|
    t.integer  "beer_id"
    t.integer  "regionalstyle_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "beerstyles", ["beer_id", "regionalstyle_id"], :name => "index_beerstyles_on_beer_id_and_regionalstyle_id"

  create_table "fermentables", :force => true do |t|
    t.integer  "api_id"
    t.text     "name"
    t.text     "description"
    t.text     "country_iso_code"
    t.integer  "moisture_content"
    t.integer  "diastatic_power"
    t.float    "dry_yield"
    t.float    "potential_yield"
    t.integer  "protein"
    t.integer  "soluble_nitrogen_ratio"
    t.integer  "max_in_batch"
    t.boolean  "requires_mashing"
    t.text     "category"
    t.text     "characteristics"
    t.integer  "srm_id"
    t.integer  "srm_precise"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "hops", :force => true do |t|
    t.text     "name"
    t.integer  "api_id"
    t.text     "description"
    t.text     "country_iso_code"
    t.float    "alpha_acid_min"
    t.float    "alpha_acid_max"
    t.float    "beta_acid_min"
    t.float    "beta_acid_max"
    t.float    "humulene_min"
    t.float    "humulene_max"
    t.float    "caryophyllene_min"
    t.float    "caryophyllene_max"
    t.float    "cohumulone_min"
    t.float    "cohumulone_max"
    t.float    "myrcene_min"
    t.float    "myrcene_max"
    t.float    "farnesene_min"
    t.float    "farnesene_max"
    t.boolean  "is_noble"
    t.boolean  "for_bittering"
    t.boolean  "for_flavor"
    t.boolean  "for_aroma"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "regionalstyles", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "api_id"
    t.text     "beer_category"
    t.float    "ibu_min"
    t.float    "ibu_max"
    t.float    "abv_min"
    t.float    "abv_max"
    t.float    "srm_min"
    t.float    "srm_max"
    t.integer  "og_min"
    t.integer  "og_max"
    t.integer  "fg_min"
    t.integer  "fg_max"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviews", :force => true do |t|
    t.text     "title"
    t.date     "review_date"
    t.text     "review"
    t.integer  "rating"
    t.text     "image_url"
    t.integer  "batch_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reviews", ["batch_id", "id"], :name => "index_reviews_on_batch_id_and_id"

  create_table "specialties", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "classification"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "name"
    t.text     "brewery_name"
    t.integer  "founding_date"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "yeasts", :force => true do |t|
    t.text     "name"
    t.integer  "api_id"
    t.text     "description"
    t.text     "yeast_type"
    t.integer  "attenuation_min"
    t.integer  "attenuation_max"
    t.integer  "ferment_temp_min"
    t.integer  "ferment_temp_max"
    t.integer  "alcohol_tolerance_min"
    t.integer  "alcohol_tolerance_max"
    t.text     "supplier"
    t.text     "product_id"
    t.text     "yeast_format"
    t.text     "category"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
