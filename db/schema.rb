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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_125853) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "career_data", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.string "season", limit: 7
    t.string "team_name", limit: 255
    t.decimal "salary_amount"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "mlb_players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "team"
    t.integer "salary"
    t.date "date_of_birth"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "nba_contract_info", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.string "player_name"
    t.integer "con_years"
    t.decimal "amount", precision: 15, scale: 2
    t.string "team", limit: 255
  end

  create_table "nba_contract_infos", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.string "player_name"
    t.integer "con_years"
    t.decimal "amount"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_nba_contract_infos_on_player_id"
  end

  create_table "nba_salaries", id: false, force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "id"
    t.decimal "amount"
    t.string "season"
  end

  create_table "nba_teams_car", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "player_id"
    t.string "season"
    t.string "team_name"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "age"
    t.string "team"
    t.decimal "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "team_id", null: false
    t.string "image"
    t.date "date_of_birth"
    t.index ["slug"], name: "index_players_on_slug", unique: true
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["category_id"], name: "index_teams_on_category_id"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  add_foreign_key "nba_contract_infos", "players"
  add_foreign_key "players", "teams"
  add_foreign_key "teams", "categories"
end
