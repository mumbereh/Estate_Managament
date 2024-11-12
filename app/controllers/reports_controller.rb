# class ReportsController < ApplicationController
#   def index
#     @tenants = Tenant.includes(:leases, :payments, :room, room: [:estate, :room_type]).all
#   end

#   def tenant_report
#     @tenant = Tenant.find(params[:tenant_id])
#     @leases = @tenant.leases.includes(:payments, :room, room: [:estate, :room_type])
#     @payments = @leases.flat_map(&:payments)
#   end
# end


class ReportsController < ApplicationController
  def index
    @tenants = Tenant.includes(:leases, :payments, :room, room: [:estate, :room_type]).all
  end

  def tenant_report
    @tenant = Tenant.find(params[:tenant_id])
    @leases = @tenant.leases.includes(:payments, :room, room: [:estate, :room_type])
    @payments = @leases.flat_map(&:payments)
  end

  def estate_report
    @estates = Estate.includes(rooms: { tenants: { leases: :payments } }).all

    @estate_reports = @estates.map do |estate|
      monthly_data = {}

      estate.rooms.each do |room|
        room.tenants.each do |tenant|
          tenant.leases.each do |lease|
            lease.payments.each do |payment|
              month = payment.payment_date.strftime("%B %Y")
              
              monthly_data[month] ||= { collected: 0, outstanding: 0 }
              monthly_data[month][:collected] += payment.amount

              monthly_due = lease.monthly_rent
              monthly_data[month][:outstanding] += (monthly_due - payment.amount) if payment.amount < monthly_due
            end
          end
        end
      end

      { estate: estate, monthly_data: monthly_data }
    end
  end
end
