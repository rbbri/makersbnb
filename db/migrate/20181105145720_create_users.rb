# Create users table
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
      table.string :username
      table.string :password
      table.string :name
      table.string :email
    end
  end
end
