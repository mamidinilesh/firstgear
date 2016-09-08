class VendorContractsController < ApplicationController
  def new
    @vendor_contract = VendorContract.new
    @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
    @categories=Category.all.map{ |category| [ category.name, category.id ] }
  end

  def show
    @vendor_contract= VendorContract.find(params[:id])
  end

  def create
    @vendor_contract = VendorContract.new(vendor_contract_params)
    @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }

    @categories=Category.all.map{ |category| [ category.name, category.id ] }
    categories = params[:vendor_contract][:vende_contrct_maps].values.first
    commission = params[:vendor_contract][:vende_contrct_maps].values.second
    is_inclusive = params[:vendor_contract][:vende_contrct_maps].values.third
    active = @vendor_contract.active
    # "vende_contrct_maps"=>{"category_id"=>"2", "commission"=>"13", "is_inclusive"=>"1"}, "active"=>"1"}
  #  debugger



    #        debugger
    respond_to do |format|
      if @vendor_contract.save
        vd_id=VendorContract.last.id
        categories.each do |cat_id|
          if(cat_id.present?)
            @vende_contrct_map = VendeContrctMap.new
            @vende_contrct_map.vendor_contract_id=vd_id
            @vende_contrct_map.category_id=cat_id
            @vende_contrct_map.commission=commission
            @vende_contrct_map.is_inclusive=is_inclusive
            @vende_contrct_map.active=active
            @vende_contrct_map.save
          end
        end

        format.html { redirect_to @vendor_contract, notice: 'vendor_contract was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_contract }
      else
        format.html { render :new }
        format.json { render json: @vendor_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @vendor_contract = VendorContract.find(params[:id])
      @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }

      @categories=Category.all.map{ |category| [ category.name, category.id ] }
      categories = params[:vendor_contract][:vende_contrct_map].values.first
      commission = params[:vendor_contract][:vende_contrct_map].values.second
      is_inclusive = params[:vendor_contract][:vende_contrct_map].values.third
      active  = @vendor_contract.active
      #debugger

      if @vendor_contract.update(vendor_contract_params)
        @vende_contrct_maps=VendeContrctMap.select do | f|
          f.vendor_contract_id== @vendor_contract.id
        end

        @vende_contrct_maps.each do |u|

          u.destroy
        end
        vd_id=@vendor_contract.id
        categories.each do |cat_id|
          if(cat_id.present?)
            @vende_contrct_map = VendeContrctMap.new
            @vende_contrct_map.vendor_contract_id=vd_id
            @vende_contrct_map.category_id=cat_id
            @vende_contrct_map.commission=commission
            @vende_contrct_map.is_inclusive=is_inclusive
            @vende_contrct_map.active=active
            @vende_contrct_map.save
          end
        end
        format.html { redirect_to @vendor_contract, notice: 'vendor_contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_contract }
      else
        format.html { render :edit }
        format.json { render json: @vendor_contract.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @vendor_contract= VendorContract.find(params[:id])

    @vende_contrct_maps=VendeContrctMap.select do |s|
      s.vendor_contract_id == @vendor_contract.id
    end
    @vende_contrct_map=@vende_contrct_maps.first
    @ids=@vende_contrct_maps.pluck(:category_id)
    @vendors = Vendor.all.map{ |vendor| [ vendor.name, vendor.id ] }
    @categories=Category.all.map{ |category| [ category.name, category.id ] }


  end
  def index
    @vendor_contracts=VendorContract.all
  end

  private
  def vendor_contract_params
    params.require(:vendor_contract).permit(:vendor_id , :start_date, :end_date, :comments ,:listing_fees ,
    :listing_fees_paid , :active , vende_contrct_maps_attributes: [ :vendor_contract_id, :category_id, :commission, :is_inclusive])
  end

  def set_vendor_contract
    @vendor_contract = VendorContract.find(params[:id])
  end
end
