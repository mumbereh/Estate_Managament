class AddEstateIdToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :estate_id, :integer
  end
end
