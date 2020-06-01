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

ActiveRecord::Schema.define(version: 2020_05_31_165130) do

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

  create_table "buyers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "kana_name", default: "", null: false
    t.string "company_name", default: "", null: false
    t.string "kana_company_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "postcode", default: "", null: false
    t.string "address", default: "", null: false
    t.boolean "industory", default: false, null: false
    t.text "description"
    t.string "profile_image_id"
    t.string "hp"
    t.integer "prefecture", default: 0, null: false
    t.index ["company_name"], name: "index_buyers_on_company_name"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "producer_id", null: false
    t.integer "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "producer_id", null: false
    t.integer "buyer_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "producer_id", null: false
    t.integer "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.boolean "is_producer"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chat_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "producer_id"
    t.integer "buyer_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "heading", default: "", null: false
    t.string "image_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "kana_name", default: "", null: false
    t.string "company_name", default: "", null: false
    t.string "kana_company_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.text "description"
    t.string "profile_image_id"
    t.string "postcode", default: "", null: false
    t.string "address", default: "", null: false
    t.string "hp"
    t.integer "prefecture", default: 0, null: false
    t.index ["company_name"], name: "index_producers_on_company_name"
    t.index ["email"], name: "index_producers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_producers_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "product_image_id"
    t.text "description", null: false
    t.integer "price", null: false
    t.string "timing", null: false
    t.integer "producer_id", null: false
    t.integer "category_id", null: false
    t.integer "prefecture", default: 0, null: false
  end

end
