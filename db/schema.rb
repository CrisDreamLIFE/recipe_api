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

ActiveRecord::Schema[7.1].define(version: 2024_09_25_144451) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "category_id", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "material_id", null: false
    t.float "quantity"
    t.integer "measurement_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_ingredients_on_material_id"
    t.index ["measurement_unit_id"], name: "index_ingredients_on_measurement_unit_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurement_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "portions"
    t.text "preparation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "recipes_tags", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "recipes_users", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "materials"
  add_foreign_key "ingredients", "measurement_units"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "users"
end
