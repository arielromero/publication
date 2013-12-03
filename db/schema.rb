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

ActiveRecord::Schema.define(:version => 20131121202915) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.datetime "begin_at"
    t.datetime "finish_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campaigns_products", :force => true do |t|
    t.integer "campaign_id"
    t.integer "product_id"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_delivereds", :force => true do |t|
    t.integer  "subscription_id"
    t.integer  "product_received_id"
    t.datetime "delivered_at"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "product_receiveds", :force => true do |t|
    t.integer  "product_id"
    t.integer  "total"
    t.integer  "campaign_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "received_at"
  end

  create_table "product_subscriptions", :force => true do |t|
    t.integer  "subscription_id"
    t.integer  "product_id"
    t.integer  "total"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "product_subscriptions", ["product_id"], :name => "index_product_subscriptions_on_product_id"
  add_index "product_subscriptions", ["subscription_id"], :name => "index_product_subscriptions_on_subscription_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "numbers"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "abbreviation"
  end

  create_table "subscriptions", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.integer  "member_id"
    t.integer  "campaign_id"
    t.datetime "updated_at",  :null => false
  end

  add_index "subscriptions", ["campaign_id"], :name => "index_subscriptions_on_campaign_id"
  add_index "subscriptions", ["member_id"], :name => "index_subscriptions_on_member_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
