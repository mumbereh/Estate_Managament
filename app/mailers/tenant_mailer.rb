class TenantMailer < ApplicationMailer
  default from: 'teamfromestatemanagementsys@gmail.com'

  def payment_received(tenant, payment, user)
    @payment = payment
    @tenant = tenant
    @room = payment.lease.room
    @user = user
    @months_covered = (payment.start_month..payment.end_month).map { |date| date.strftime("%B %Y") }.uniq
    @receipt_number = generate_receipt_number 
    mail(to: @tenant.email, subject: 'Payment Receipt')
  end

  private

  def generate_receipt_number
    rand(10000..99999)  
  end
end
