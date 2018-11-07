ActiveRecord::Schema.define(version: 20_181_106_122_314) do
  enable_extension 'plpgsql'

  create_table 'requests', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'space_id'
    t.datetime 'date_created'
    t.string 'booking_date'
    t.string 'confirmation_status', default: 'Awaiting confirmation'
    t.index ['space_id'], name: 'index_requests_on_space_id'
    t.index ['user_id'], name: 'index_requests_on_user_id'
  end

  create_table 'spaces', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'price'
    t.integer 'user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.string 'name'
    t.string 'email'
  end
end
