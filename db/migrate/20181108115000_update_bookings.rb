# Update bookings table to have nights instead of end_date
class UpdateBookings < ActiveRecord::Migration[5.2]
  def change
    change_table :bookings do |table|
      table.remove :end_date
      table.integer :nights
    end
  end
end
