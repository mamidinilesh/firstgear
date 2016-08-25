class RegionsController < ApplicationController
  def new
    @region = Region.new
    @cities = City.all
  end
  def show
    @region= Region.find(params[:id])
      @cities = City.all
  end
  def create
    @region= Region.new(region_params)
    @city = City.find_by(id: region_params[:state_id])

    @cities = City.all
    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, service: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
        @region = Region.find(params[:id])

      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
      @region= Region.find(params[:id])
        @cities = City.all
  end
  def index
    @regions= Region.all
      @cities = City.all
  end

  private
  def region_params
    params.require(:region).permit(:name , :city_id,  :active)
  end

  def set_region
    @region = Region.find(params[:id])
  end
end
