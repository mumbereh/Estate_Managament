class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy, :tenants]

  def index
    @estates = Estate.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @estate = Estate.new
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      redirect_to @estate, notice: 'Estate was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @estate.update(estate_params)
      redirect_to @estate, notice: 'Estate was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @estate.destroy
    redirect_to estates_url, notice: 'Estate was successfully destroyed.'
  end

  # New action for displaying tenants of a specific estate
  def tenants
    @tenants = @estate.tenants.paginate(page: params[:page], per_page: 10)
  end

  private

  def set_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:name, :location, :owner, :description)
  end
end