  class VehiclesController < ApplicationController
    def new
      @vehicle = Vehicle.new
      @brands = Brand.all
    end
    def show
      @vehicle= Vehicle.find(params[:id])
      
    end
    def create
      @vehicle=Vehicle.new(vehicle_params)
      @brand = Brand.find_by(id: vehicle_params[:brand_id])
      @vehicle.brand_id = vehicle_params[:brand_id]
      @brands = Brand.all
      respond_to do |format|
        if @vehicle.save
          format.html { redirect_to @vehicle, vehicle: 'Vehicle was successfully created.' }
          format.json { render :show, status: :created, location: @vehicle }
        else
          format.html { render :new }
          format.json { render json: @vehicle.errors, status: :unprocessable_entity }
        end
      end
    end
    def update
      respond_to do |format|
          @vehicle = Vehicle.find(params[:id])

        if @vehicle.update(vehicle_params)
          format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
          format.json { render :show, status: :ok, location: @vehicle }
        else
          format.html { render :edit }
          format.json { render json: @vehicle.errors, status: :unprocessable_entity }
        end
      end
    end
    def edit
        @vehicle= Vehicle.find(params[:id])
          @brands = Brand.all
    end
    def index
      @vehicles=Vehicle.all
        @brands = Brand.all
    end

  private
    def vehicle_params
      params.require(:vehicle).permit(:v_type , :brand_id, :model, :variant, :transmission, :active)
    end

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  end
