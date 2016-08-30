class VendeContrctMapsController < ApplicationController
  before_action :set_vende_contrct_map, only: [:show, :edit, :update, :destroy]

  # GET /vende_contrct_maps
  # GET /vende_contrct_maps.json
  def index
    @vende_contrct_maps = VendeContrctMap.all

  end

  # GET /vende_contrct_maps/1
  # GET /vende_contrct_maps/1.json
  def show
    @vendor_contracts=VendorContract.find(params[:id])
  end

  # GET /vende_contrct_maps/new
  def new
    @vende_contrct_map = VendeContrctMap.new
    @vendor_contracts=VendorContract.all.map{ |vendor_contract| [ vendor_contract.id, vendor_contract.id ] }
      @categories=Category.all.map{ |category| [ category.name, category.id ] }
  end

  # GET /vende_contrct_maps/1/edit
  def edit
    @vendor_contracts=VendorContract.find(params[:id])
    @vendor_contracts=VendorContract.all.map{ |vendor_contract| [ vendor_contract.id, vendor_contract.id ] }
      @categories=Category.all.map{ |category| [ category.name, category.id ] }
  end

  

  # POST /vende_contrct_maps
  # POST /vende_contrct_maps.json
  def create
    @vende_contrct_map = VendeContrctMap.new(vende_contrct_map_params)

    respond_to do |format|
      if @vende_contrct_map.save
        format.html { redirect_to @vende_contrct_map, notice: 'Vende contrct map was successfully created.' }
        format.json { render :show, status: :created, location: @vende_contrct_map }
      else
        format.html { render :new }
        format.json { render json: @vende_contrct_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vende_contrct_maps/1
  # PATCH/PUT /vende_contrct_maps/1.json
  def update
    respond_to do |format|
      if @vende_contrct_map.update(vende_contrct_map_params)
        format.html { redirect_to @vende_contrct_map, notice: 'Vende contrct map was successfully updated.' }
        format.json { render :show, status: :ok, location: @vende_contrct_map }
      else
        format.html { render :edit }
        format.json { render json: @vende_contrct_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vende_contrct_maps/1
  # DELETE /vende_contrct_maps/1.json
  def destroy
    @vende_contrct_map.destroy
    respond_to do |format|
      format.html { redirect_to vende_contrct_maps_url, notice: 'Vende contrct map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vende_contrct_map
      @vende_contrct_map = VendeContrctMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vende_contrct_map_params
      params.require(:vende_contrct_map).permit(:vendor_contract_id, :category_id, :commission, :is_inclusive, :active)
    end
end
