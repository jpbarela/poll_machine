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

ActiveRecord::Schema.define(version: 20_160_817_113_328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', force: :cascade do |t|
    t.integer  'choice_id'
    t.integer  'response_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['choice_id'], name: 'index_answers_on_choice_id', using: :btree
    t.index ['response_id'], name: 'index_answers_on_response_id', using: :btree
  end

  create_table 'choices', force: :cascade do |t|
    t.string   'value'
    t.integer  'question_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['question_id'], name: 'index_choices_on_question_id', using: :btree
  end

  create_table 'polls', force: :cascade do |t|
    t.string   'name',       null: false
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_polls_on_user_id', using: :btree
  end

  create_table 'questions', force: :cascade do |t|
    t.string   'text'
    t.integer  'poll_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['poll_id'], name: 'index_questions_on_poll_id', using: :btree
  end

  create_table 'responses', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'poll_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['poll_id'], name: 'index_responses_on_poll_id', using: :btree
    t.index ['user_id'], name: 'index_responses_on_user_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email'
    t.string   'first_name'
    t.string   'last_name'
    t.string   'password_digest'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end
end
