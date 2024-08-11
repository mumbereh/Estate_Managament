class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_leases, only: [:new, :edit]

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      TenantMailer.payment_received(@payment.lease.tenant, @payment).deliver_now
      redirect_to @payment, notice: 'Payment was successfully created.'
    else
      @leases = Lease.all
      render :new
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: 'Payment was successfully updated.'
    else
      @leases = Lease.all
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_url, notice: 'Payment was successfully destroyed.'
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def set_leases
    @leases = Lease.all
  end

  def payment_params
    params.require(:payment).permit(:lease_id, :amount, :payment_date)
  end
end
