

ActiveRecord::Schema.define(version: 20151206122842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conventions", force: :cascade do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.string   "country"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_players"
    t.integer  "time"
    t.integer  "rate"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "matches", force: :cascade do |t|
    t.decimal  "time"
    t.integer  "seats_number"
    t.decimal  "price"
    t.integer  "game_id"
    t.integer  "convention_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "matches", ["convention_id"], name: "index_matches_on_convention_id", using: :btree
  add_index "matches", ["game_id"], name: "index_matches_on_game_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participations", ["match_id"], name: "index_participations_on_match_id", using: :btree
  add_index "participations", ["player_id"], name: "index_participations_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "surname"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "symbol"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "conventions"
  add_foreign_key "matches", "games"
  add_foreign_key "participations", "matches"
  add_foreign_key "participations", "players"
  add_foreign_key "players", "teams"
end
