class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
    @regions = Region.all.map{ |region| [ region.name, region.id ] }
    @vendor_types= VendorType.all.map{ |vendor_type| [ vendor_type.vendor_type, vendor_type.id ] }
    @cities = City.all.map{ |city| [ city.name, city.id ] }
    @states= State.all.map{ |state| [ state.name, state.id ] }
  end
  def show
    @vendor = Vendor.find(params[:id])
  end
  def create
    @vendor= Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, service: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
        @vendor = Vendor.find(params[:id])
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, service: 'Vendor was successfully updated.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
      @vendor = Vendor.find(params[:id])
      @regions = Region.all.map{ |region| [ region.name, region.id ] }
      @vendor_types= VendorType.all.map{ |vendor_type| [ vendor_type.vendor_type, vendor_type.id ] }
      @cities = City.all.map{ |city| [ city.name, city.id ] }
      @states= State.all.map{ |state| [ state.name, state.id ] }
  end
  def index
    @vendors = Vendor.all

  end

  private
  def vendor_params
    params.require(:vendor).permit( :name , :address1 , :address2 , :street , :region_id , :city_id , :state_id,
     :lat ,  :lng , :ranking ,:vendor_type_id , :contact_name_1 , :contact_email_1 , :contact_mob_1 ,
      :contact_name_2 , :contact_email_2 , :contact_mob_2 , :listing_category , :active )
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end
end
