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

ActiveRecord::Schema.define(version: 20170429032058) do

  create_table "artists_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_artists_games_on_creator_id"
    t.index ["game_id", "creator_id"], name: "index_artists_games_on_game_id_and_creator_id", unique: true
    t.index ["game_id"], name: "index_artists_games_on_game_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_games", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_categories_games_on_category_id"
    t.index ["game_id", "category_id"], name: "index_categories_games_on_game_id_and_category_id", unique: true
  end

  create_table "creators", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designers_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_designers_games_on_creator_id"
    t.index ["game_id", "creator_id"], name: "index_designers_games_on_game_id_and_creator_id", unique: true
    t.index ["game_id"], name: "index_designers_games_on_game_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families_games", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "family_id", null: false
    t.index ["family_id"], name: "index_families_games_on_family_id"
    t.index ["game_id", "family_id"], name: "index_families_games_on_game_id_and_family_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "bgg_id"
    t.integer "yearpublished"
    t.integer "minplayers"
    t.integer "maxplayers"
    t.integer "playingtime"
    t.integer "minplaytime"
    t.integer "maxplaytime"
    t.integer "age"
    t.string "thumbnail"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_honors", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "honor_id", null: false
    t.index ["game_id", "honor_id"], name: "index_games_honors_on_game_id_and_honor_id", unique: true
    t.index ["honor_id"], name: "index_games_honors_on_honor_id"
  end

  create_table "games_mechanics", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "mechanic_id", null: false
    t.index ["game_id", "mechanic_id"], name: "index_games_mechanics_on_game_id_and_mechanic_id", unique: true
    t.index ["mechanic_id"], name: "index_games_mechanics_on_mechanic_id"
  end

  create_table "games_publishers", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "publisher_id", null: false
    t.index ["game_id", "publisher_id"], name: "index_games_publishers_on_game_id_and_publisher_id", unique: true
    t.index ["publisher_id"], name: "index_games_publishers_on_publisher_id"
  end

  create_table "games_subdomains", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "subdomain_id", null: false
    t.index ["game_id", "subdomain_id"], name: "index_games_subdomains_on_game_id_and_subdomain_id", unique: true
    t.index ["subdomain_id"], name: "index_games_subdomains_on_subdomain_id"
  end

  create_table "honors", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdomains", force: :cascade do |t|
    t.string "name"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
