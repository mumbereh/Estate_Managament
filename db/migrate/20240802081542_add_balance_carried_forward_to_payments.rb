class AddBalanceCarriedForwardToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :balance_carried_forward, :decimal
  end
end
