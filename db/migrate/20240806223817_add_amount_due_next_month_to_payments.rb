class AddAmountDueNextMonthToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :amount_due_next_month, :decimal
  end
end
