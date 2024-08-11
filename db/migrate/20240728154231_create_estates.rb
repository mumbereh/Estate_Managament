class CreateEstates < ActiveRecord::Migration[7.1]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :owner
      t.string :location
      t.text :description

      t.timestamps
    end

    add_index :estates, :name, unique: true
  end
end
