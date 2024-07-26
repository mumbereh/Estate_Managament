class CreateRoomTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :room_types do |t|
      t.string :code
      t.string :status_name
      t.text :description

      t.timestamps
    end
  end
end
