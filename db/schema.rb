ActiveRecord::Schema.define(version: 20_181_105_165_949) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

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
