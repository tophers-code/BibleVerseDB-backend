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

ActiveRecord::Schema[8.0].define(version: 2026_02_08_044408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bible_books", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.integer "testament", null: false
    t.integer "book_order", null: false
    t.integer "chapter_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_order"], name: "index_bible_books_on_book_order", unique: true
    t.index ["name"], name: "index_bible_books_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "meaning", null: false
    t.string "color_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "daily_entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.decimal "weight"
    t.decimal "sleep_hours"
    t.integer "water_intake"
    t.integer "fitness_minutes"
    t.decimal "compliance_score"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mood"
    t.index ["user_id"], name: "index_daily_entries_on_user_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.bigint "food_category_id", null: false
    t.string "name"
    t.string "serving_size"
    t.decimal "cost_per_package"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_category_id"], name: "index_food_items_on_food_category_id"
  end

  create_table "inventory_entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "food_item_id", null: false
    t.decimal "packages_remaining"
    t.date "last_ordered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_inventory_entries_on_food_item_id"
    t.index ["user_id"], name: "index_inventory_entries_on_user_id"
  end

  create_table "meal_entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "meal_time"
    t.datetime "scheduled_time"
    t.datetime "actual_time"
    t.text "free_text_items"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meal_entries_on_user_id"
  end

  create_table "meal_items", force: :cascade do |t|
    t.bigint "meal_entry_id", null: false
    t.bigint "food_item_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_meal_items_on_food_item_id"
    t.index ["meal_entry_id"], name: "index_meal_items_on_meal_entry_id"
  end

  create_table "meal_plan_items", force: :cascade do |t|
    t.bigint "meal_plan_id", null: false
    t.bigint "food_item_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_meal_plan_items_on_food_item_id"
    t.index ["meal_plan_id", "food_item_id"], name: "index_meal_plan_items_on_meal_plan_id_and_food_item_id", unique: true
    t.index ["meal_plan_id"], name: "index_meal_plan_items_on_meal_plan_id"
  end

  create_table "meal_plan_template_items", force: :cascade do |t|
    t.bigint "meal_plan_template_id", null: false
    t.bigint "food_item_id", null: false
    t.integer "day_number", null: false
    t.string "meal_slot", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_meal_plan_template_items_on_food_item_id"
    t.index ["meal_plan_template_id", "day_number", "meal_slot", "food_item_id"], name: "idx_meal_plan_template_items_unique", unique: true
    t.index ["meal_plan_template_id"], name: "index_meal_plan_template_items_on_meal_plan_template_id"
  end

  create_table "meal_plan_templates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.boolean "is_default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_meal_plan_templates_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_meal_plan_templates_on_user_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "plan_date", null: false
    t.string "meal_slot", null: false
    t.string "name"
    t.text "notes"
    t.bigint "meal_plan_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_plan_template_id"], name: "index_meal_plans_on_meal_plan_template_id"
    t.index ["user_id", "plan_date", "meal_slot"], name: "index_meal_plans_on_user_id_and_plan_date_and_meal_slot", unique: true
    t.index ["user_id", "plan_date"], name: "index_meal_plans_on_user_id_and_plan_date"
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "progression_steps", force: :cascade do |t|
    t.bigint "verse_progression_id", null: false
    t.bigint "verse_id", null: false
    t.integer "step_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["verse_id"], name: "index_progression_steps_on_verse_id"
    t.index ["verse_progression_id", "step_order"], name: "index_progression_steps_on_verse_progression_id_and_step_order", unique: true
    t.index ["verse_progression_id"], name: "index_progression_steps_on_verse_progression_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.decimal "target_weight"
    t.decimal "current_weight"
    t.decimal "height"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mamr_tracking_enabled", default: false, null: false
  end

  create_table "verse_categories", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.index ["category_id"], name: "index_verse_categories_on_category_id"
    t.index ["verse_id", "category_id"], name: "index_verse_categories_on_verse_id_and_category_id", unique: true
    t.index ["verse_id"], name: "index_verse_categories_on_verse_id"
  end

  create_table "verse_progressions", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_verse_progressions_on_name", unique: true
  end

  create_table "verse_references", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.bigint "referenced_verse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referenced_verse_id"], name: "index_verse_references_on_referenced_verse_id"
    t.index ["verse_id", "referenced_verse_id"], name: "index_verse_references_on_verse_id_and_referenced_verse_id", unique: true
    t.index ["verse_id"], name: "index_verse_references_on_verse_id"
  end

  create_table "verse_texts", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.string "version", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["verse_id", "version"], name: "index_verse_texts_on_verse_id_and_version", unique: true
    t.index ["verse_id"], name: "index_verse_texts_on_verse_id"
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "bible_book_id", null: false
    t.integer "chapter", null: false
    t.integer "verse_start", null: false
    t.integer "verse_end"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bible_book_id", "chapter", "verse_start", "verse_end"], name: "index_verses_on_book_chapter_verse", unique: true
    t.index ["bible_book_id"], name: "index_verses_on_bible_book_id"
  end

  add_foreign_key "daily_entries", "users"
  add_foreign_key "food_items", "food_categories"
  add_foreign_key "inventory_entries", "food_items"
  add_foreign_key "inventory_entries", "users"
  add_foreign_key "meal_entries", "users"
  add_foreign_key "meal_items", "food_items"
  add_foreign_key "meal_items", "meal_entries"
  add_foreign_key "meal_plan_items", "food_items"
  add_foreign_key "meal_plan_items", "meal_plans"
  add_foreign_key "meal_plan_template_items", "food_items"
  add_foreign_key "meal_plan_template_items", "meal_plan_templates"
  add_foreign_key "meal_plan_templates", "users"
  add_foreign_key "meal_plans", "meal_plan_templates"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "progression_steps", "verse_progressions"
  add_foreign_key "progression_steps", "verses"
  add_foreign_key "verse_categories", "categories"
  add_foreign_key "verse_categories", "verses"
  add_foreign_key "verse_references", "verses"
  add_foreign_key "verse_references", "verses", column: "referenced_verse_id"
  add_foreign_key "verse_texts", "verses"
  add_foreign_key "verses", "bible_books"
end
