class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |table|
      table.string :name
      table.string :description
      table.integer :price
      table.integer :user_id
      table.references :user
    end
  end
end
