# Update spaces table to have start and end date
class UpdateSpaces < ActiveRecord::Migration[5.2]
  def change
    change_table :spaces do |table|
      table.date :start_date
      table.date :end_date
    end
  end
end
