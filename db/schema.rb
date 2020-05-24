# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_013554) do

  create_table "answers", force: :cascade do |t|
    t.text "option"
    t.boolean "is_answer"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option"], name: "index_answers_on_option"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "preference_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "workbook_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "workbook_id"], name: "index_preference_relationships_on_user_id_and_workbook_id", unique: true
    t.index ["user_id"], name: "index_preference_relationships_on_user_id"
    t.index ["workbook_id"], name: "index_preference_relationships_on_workbook_id"
  end

  create_table "psychologies", force: :cascade do |t|
    t.string "category"
    t.text "explanation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "font_awesome_icon"
    t.string "japanese_field_name"
    t.string "field"
    t.index ["category"], name: "index_psychologies_on_category"
    t.index ["explanation"], name: "index_psychologies_on_explanation"
  end

  create_table "questions", force: :cascade do |t|
    t.text "explanation"
    t.integer "workbook_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workbook_id"], name: "index_questions_on_workbook_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "workbooks", force: :cascade do |t|
    t.string "subject_name"
    t.text "subject_explanation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subject_image"
    t.integer "psychology_id"
    t.integer "questions_count", default: 0, null: false
  end

  add_foreign_key "answers", "questions"
end
