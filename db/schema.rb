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

ActiveRecord::Schema[8.0].define(version: 2026_02_17_140000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

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

  create_table "book_copies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id", null: false
    t.uuid "registered_by_id", null: false
    t.string "condition"
    t.text "notes"
    t.string "qr_code_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_copies_on_book_id"
    t.index ["qr_code_token"], name: "index_book_copies_on_qr_code_token", unique: true
    t.index ["registered_by_id"], name: "index_book_copies_on_registered_by_id"
  end

  create_table "book_isbns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id", null: false
    t.string "isbn", null: false
    t.string "isbn_type"
    t.string "edition"
    t.string "publisher"
    t.string "cover_image_url"
    t.integer "page_count"
    t.integer "publish_year"
    t.text "edition_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_isbns_on_book_id"
    t.index ["isbn"], name: "index_book_isbns_on_isbn", unique: true
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.text "description"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "meaning", null: false
    t.string "color_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "ownerships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_copy_id", null: false
    t.uuid "user_id", null: false
    t.boolean "is_current", default: true
    t.datetime "acquired_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_copy_id", "is_current"], name: "index_ownerships_on_book_copy_id_and_is_current"
    t.index ["book_copy_id"], name: "index_ownerships_on_book_copy_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
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

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "username"
    t.string "role", default: "buyer"
    t.string "supabase_uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["supabase_uid"], name: "index_users_on_supabase_uid", unique: true
  end

  create_table "verse_categories", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.boolean "prominent", default: false, null: false
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

  create_table "verse_tags", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_verse_tags_on_tag_id"
    t.index ["verse_id", "tag_id"], name: "index_verse_tags_on_verse_id_and_tag_id", unique: true
    t.index ["verse_id"], name: "index_verse_tags_on_verse_id"
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

  add_foreign_key "book_copies", "books"
  add_foreign_key "book_copies", "users", column: "registered_by_id"
  add_foreign_key "book_isbns", "books"
  add_foreign_key "ownerships", "book_copies"
  add_foreign_key "ownerships", "users"
  add_foreign_key "progression_steps", "verse_progressions"
  add_foreign_key "progression_steps", "verses"
  add_foreign_key "verse_categories", "categories"
  add_foreign_key "verse_categories", "verses"
  add_foreign_key "verse_references", "verses"
  add_foreign_key "verse_references", "verses", column: "referenced_verse_id"
  add_foreign_key "verse_tags", "tags"
  add_foreign_key "verse_tags", "verses"
  add_foreign_key "verse_texts", "verses"
  add_foreign_key "verses", "bible_books"
end
