class VenderServiceMapsController < ApplicationController
  before_action :set_vender_service_map, only: [:show, :edit, :update, :destroy]

  # GET /vender_service_maps
  # GET /vender_service_maps.json
  def index
    @vender_service_maps = VenderServiceMap.all
  end

  # GET /vender_service_maps/1
  # GET /vender_service_maps/1.json
  def show
@vender_service_maps= VenderServiceMap.find(params[:id])
  end

  # GET /vender_service_maps/new
  def new
    @vender_service_map = VenderServiceMap.new
    @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
    @vehicles = Vehicle.all.map{ |vehicle| [ vehicle.model, vehicle.id ] }
    @services = Service.all.map{ |service| [ service.name, service.id ] }
  end

  # GET /vender_service_maps/1/edit
  def edit
    @vender_service_maps= VenderServiceMap.find(params[:id])
    @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
    @vehicles = Vehicle.all.map{ |vehicle| [ vehicle.model, vehicle.id ] }
    @services = Service.all.map{ |service| [ service.name, service.id ] }
  end

  # POST /vender_service_maps
  # POST /vender_service_maps.json
  def create
    @vender_service_map = VenderServiceMap.new(vender_service_map_params)

    respond_to do |format|
      if @vender_service_map.save
        format.html { redirect_to @vender_service_map, notice: 'Vender service map was successfully created.' }
        format.json { render :show, status: :created, location: @vender_service_map }
      else
        format.html { render :new }
        format.json { render json: @vender_service_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vender_service_maps/1
  # PATCH/PUT /vender_service_maps/1.json
  def update
    respond_to do |format|
      if @vender_service_map.update(vender_service_map_params)
        format.html { redirect_to @vender_service_map, notice: 'Vender service map was successfully updated.' }
        format.json { render :show, status: :ok, location: @vender_service_map }
      else
        format.html { render :edit }
        format.json { render json: @vender_service_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vender_service_maps/1
  # DELETE /vender_service_maps/1.json
  def destroy
    @vender_service_map.destroy
    respond_to do |format|
      format.html { redirect_to vender_service_maps_url, notice: 'Vender service map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vender_service_map
      @vender_service_map = VenderServiceMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vender_service_map_params
      params.require(:vender_service_map).permit(:vendor_id, :service_id, :vehicle_id, :commission, :is_inclusive, :active)
    end
end
