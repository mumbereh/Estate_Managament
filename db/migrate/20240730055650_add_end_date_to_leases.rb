class AddEndDateToLeases < ActiveRecord::Migration[7.1]
  def change
    add_column :leases, :end_date, :date
  end
end
