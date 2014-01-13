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

ActiveRecord::Schema.define(:version => 20140113222438) do

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
