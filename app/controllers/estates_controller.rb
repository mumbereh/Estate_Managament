class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy, :tenants, :tenants_with_payments]

  # GET /estates
  def index
    @estates = Estate.paginate(page: params[:page], per_page: 10)
  end

  # GET /estates/:id
  def show
  end

  # GET /estates/new
  def new
    @estate = Estate.new
  end

  # POST /estates
  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      redirect_to @estate, notice: 'Estate was successfully created.'
    else
      render :new
    end
  end

  # GET /estates/:id/edit
  def edit
  end

  # PATCH/PUT /estates/:id
  def update
    if @estate.update(estate_params)
      redirect_to @estate, notice: 'Estate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estates/:id
  def destroy
    @estate.destroy
    redirect_to estates_url, notice: 'Estate was successfully destroyed.'
  end

  # GET /estates/:id/tenants
  def tenants
    @tenants = @estate.tenants.paginate(page: params[:page], per_page: 10)
    render :tenants
  end

  # GET /estates/:id/tenants_with_payments
  def tenants_with_payments
    @tenants = @estate.tenants.includes(:payments).paginate(page: params[:page], per_page: 10)
    render :tenants_with_payments
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estate
    @estate = Estate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def estate_params
    params.require(:estate).permit(:name, :location, :description) # Adjust according to your Estate model attributes
  end
end
