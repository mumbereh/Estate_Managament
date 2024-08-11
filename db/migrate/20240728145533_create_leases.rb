class CreateLeases < ActiveRecord::Migration[7.1]
  def change
    create_table :leases do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :start_date
      t.decimal :monthly_rent

      t.timestamps
    end
  end
end
