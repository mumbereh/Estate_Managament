class AddTenantIdToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :tenant_id, :integer
  end
end
