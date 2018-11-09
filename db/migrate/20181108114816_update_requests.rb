# Update requests table to have nights instead of end_date
class UpdateRequests < ActiveRecord::Migration[5.2]
  def change
    change_table :requests do |table|
      table.remove :end_date
      table.integer :nights
    end
  end
end
