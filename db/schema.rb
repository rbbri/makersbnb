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

ActiveRecord::Schema.define(version: 20_181_109_104_537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'space_id'
    t.bigint 'request_id'
    t.datetime 'date_created'
    t.date 'start_date'
    t.integer 'nights'
    t.index ['request_id'], name: 'index_bookings_on_request_id'
    t.index ['space_id'], name: 'index_bookings_on_space_id'
  end

  create_table 'requests', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'space_id'
    t.datetime 'date_created'
    t.date 'start_date'
    t.string 'confirmation_status', default: 'Awaiting confirmation'
    t.integer 'nights'
    t.index ['space_id'], name: 'index_requests_on_space_id'
    t.index ['user_id'], name: 'index_requests_on_user_id'
  end

  create_table 'spaces', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'price'
    t.bigint 'user_id'
    t.date 'start_date'
    t.date 'end_date'
    t.index ['user_id'], name: 'index_spaces_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.string 'name'
    t.string 'email'
  end
end
