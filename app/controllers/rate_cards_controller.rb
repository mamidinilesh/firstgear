class RateCardsController < ApplicationController
    def new
      @rate_card = RateCard.new
      @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
      @vehicles = Vehicle.all.map{ |vehicle| [ vehicle.model, vehicle.id ] }
      @services = Service.all.map{ |service| [ service.name, service.id ] }
    end
    def show
      @rate_card= RateCard.find(params[:id])
    end
    def create
      @rate_card= RateCard.new(rate_card_params)
      respond_to do |format|
        if @rate_card.save
          format.html { redirect_to @rate_card, service: 'Rate Card was successfully created.' }
          format.json { render :show, status: :created, location: @rate_card }
        else
          format.html { render :new }
          format.json { render json: @rate_card.errors, status: :unprocessable_entity }
        end
      end
    end
    def update
      respond_to do |format|
          @rate_card = RateCard.find(params[:id])

        if @rate_card.update(rate_card_params)
          format.html { redirect_to @rate_card, notice: 'City was successfully updated.' }
          format.json { render :show, status: :ok, location: @rate_card }
        else
          format.html { render :edit }
          format.json { render json: @rate_card.errors, status: :unprocessable_entity }
        end
      end
    end
    def edit
        @rate_card= RateCard.find(params[:id])
        @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
        @vehicles = Vehicle.all.map{ |vehicle| [ vehicle.model, vehicle.id ] }
        @services = Service.all.map{ |service| [ service.name, service.id ] }
    end
    def index
      @rate_cards= RateCard.all
    end

    private
    def rate_card_params
      params.require(:rate_card).permit(:vendor_id, :vehicle_id , :service_id, :rate , :active)
    end

    def set_rate_card
      @rate_card = RateCard.find(params[:id])
    end
    end
