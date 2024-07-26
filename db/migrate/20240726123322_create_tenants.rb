class CreateTenants < ActiveRecord::Migration[7.1]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :home_district
      t.string :village
      t.string :next_of_kin
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
