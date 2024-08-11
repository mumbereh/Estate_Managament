class AddBalanceAndMonthsCoveredToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :balance, :decimal
    add_column :payments, :months_covered, :integer
  end
end
