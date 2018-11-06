class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |table|
      table.integer :user_id
      table.integer :space_id
      table.timestamp :date_created
      table.string :booking_date
      table.string :confirmation_status, :default => 'Awaiting confirmation'
      table.references :user
      table.references :space
    end
  end
end