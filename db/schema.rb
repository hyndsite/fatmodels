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

ActiveRecord::Schema.define(:version => 20130319015326) do

  create_table "market_places", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "market_places", ["name"], :name => "index_market_places_on_name", :unique => true

  create_table "order_lines", :force => true do |t|
    t.integer  "product_id"
    t.integer  "qty"
    t.decimal  "line_total"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "tax",        :precision => 8, :scale => 2
    t.decimal  "total",      :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price",           :precision => 8, :scale => 2
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "market_place_id"
  end

  add_index "products", ["name"], :name => "index_products_on_name", :unique => true

  create_table "seller_transactions", :force => true do |t|
    t.integer  "order_id"
    t.decimal  "seller_dues", :precision => 8, :scale => 2
    t.integer  "points"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "seller_transactions", ["order_id"], :name => "index_seller_transactions_on_order_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
