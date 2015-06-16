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

ActiveRecord::Schema.define(version: 20150528175734) do

  create_table "airbrake_charts", force: :cascade do |t|
    t.string   "api_key",      limit: 255, default: "", null: false
    t.string   "project_id",   limit: 255, default: "", null: false
    t.integer  "dashboard_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "airbrake_charts", ["dashboard_id"], name: "index_airbrake_charts_on_dashboard_id", using: :btree

  create_table "dashboard_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "admin",                  limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dashboard_users", ["email"], name: "index_dashboard_users_on_email", unique: true, using: :btree
  add_index "dashboard_users", ["reset_password_token"], name: "index_dashboard_users_on_reset_password_token", unique: true, using: :btree

  create_table "dashboards", force: :cascade do |t|
    t.integer  "dashboard_user_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",                 limit: 255
    t.integer  "new_relic_account_id", limit: 4
    t.integer  "new_relic_app_id",     limit: 4
    t.string   "nr_api_key",           limit: 255
    t.string   "nr_app_id",            limit: 255
  end

  add_index "dashboards", ["dashboard_user_id"], name: "index_dashboards_on_dashboard_user_id", using: :btree
  add_index "dashboards", ["new_relic_account_id"], name: "index_dashboards_on_new_relic_account_id", using: :btree
  add_index "dashboards", ["new_relic_app_id"], name: "index_dashboards_on_new_relic_app_id", using: :btree

  create_table "heroku_charts", force: :cascade do |t|
    t.string   "api_key",        limit: 255, null: false
    t.string   "app_id_or_name", limit: 255, null: false
    t.integer  "dashboard_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "heroku_charts", ["dashboard_id"], name: "index_heroku_charts_on_dashboard_id", using: :btree

  create_table "new_relic_accounts", force: :cascade do |t|
    t.integer  "new_relic_dashboard_id", limit: 4
    t.string   "nr_api_key",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "new_relic_accounts", ["new_relic_dashboard_id"], name: "index_new_relic_accounts_on_new_relic_dashboard_id", using: :btree

  create_table "new_relic_apps", force: :cascade do |t|
    t.integer  "new_relic_account_id",   limit: 4
    t.string   "nr_app_id",              limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "new_relic_dashboard_id", limit: 4
  end

  add_index "new_relic_apps", ["new_relic_account_id"], name: "index_new_relic_apps_on_new_relic_account_id", using: :btree
  add_index "new_relic_apps", ["new_relic_dashboard_id"], name: "index_new_relic_apps_on_new_relic_dashboard_id", using: :btree

  create_table "new_relic_charts", force: :cascade do |t|
    t.string  "embedded_html", limit: 255
    t.integer "dashboard_id",  limit: 4
  end

  add_index "new_relic_charts", ["dashboard_id"], name: "index_new_relic_charts_on_dashboard_id", using: :btree

  add_foreign_key "dashboards", "dashboard_users"
  add_foreign_key "dashboards", "new_relic_accounts"
  add_foreign_key "dashboards", "new_relic_apps"
  add_foreign_key "new_relic_accounts", "dashboards", column: "new_relic_dashboard_id"
  add_foreign_key "new_relic_apps", "new_relic_accounts"
end
