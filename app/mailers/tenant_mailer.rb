class TenantMailer < ApplicationMailer
  default from: 'teamfromestatemanagementsys@gmail.com'

  def payment_received(tenant, payment)
    @payment = payment
    @tenant = tenant
    @room = payment.lease.room
    @months_covered = (payment.start_month..payment.end_month).map { |date| date.strftime("%B %Y") }.uniq

    mail(to: @tenant.email, subject: 'Payment Receipt')
  end
end
