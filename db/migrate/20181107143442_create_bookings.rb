class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |table|
      table.integer :space_id
      table.integer :request_id
      table.timestamp :date_created
      table.date :start_date
      table.date :end_date
      table.references :space
      table.references :request
    end
  end
end
