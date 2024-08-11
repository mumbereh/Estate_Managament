class ReportsController < ApplicationController
  def index
    @tenants = Tenant.includes(:leases, :payments, :room, room: [:estate, :room_type]).all
  end

  def tenant_report
    @tenant = Tenant.find(params[:tenant_id])
    @leases = @tenant.leases.includes(:payments, :room, room: [:estate, :room_type])
    @payments = @leases.flat_map(&:payments)
  end
end
