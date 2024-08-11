class AddStartAndEndMonthToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :start_month, :date
    add_column :payments, :end_month, :date
  end
end
