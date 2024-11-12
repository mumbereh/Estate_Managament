class AddEstateIdToTenants < ActiveRecord::Migration[7.1]
  def change
    add_reference :tenants, :estate, null: false, foreign_key: true
  end
end
