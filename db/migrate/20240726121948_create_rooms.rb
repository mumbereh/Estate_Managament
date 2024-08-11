class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.decimal :price
      t.references :room_type, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :rooms, :room_number, unique: true
  end
end
