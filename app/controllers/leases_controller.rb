class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  def index
    @leases = Lease.all
  end

  def show
    @lease = Lease.find(params[:id])
  end

  def new
    @lease = Lease.new
    @rooms = Room.all
    @tenants = Tenant.all
  end

  def create
    @lease = Lease.new(lease_params)
    @lease.monthly_rent = @lease.room.price if @lease.room
    if @lease.save
      redirect_to @lease, notice: 'Lease was successfully created.'
    else
      @rooms = Room.all
      @tenants = Tenant.all
      render :new
    end
  end

  def edit
    @rooms = Room.all
    @tenants = Tenant.all
  end

  def update
    if @lease.update(lease_params)
      @lease.update(monthly_rent: @lease.room.price) if @lease.room
      redirect_to @lease, notice: 'Lease was successfully updated.'
    else
      @rooms = Room.all
      @tenants = Tenant.all
      render :edit
    end
  end

  def destroy
    @lease.destroy
    redirect_to leases_url, notice: 'Lease was successfully destroyed.'
  end

  private

  def set_lease
    @lease = Lease.find(params[:id])
  end

  def lease_params
    params.require(:lease).permit(:start_date, :end_date, :tenant_id, :room_id)
  end
end
