class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
    @regions = Region.all.map{ |region| [ region.name, region.id ] }
    @vendor_types= VendorType.all.map{ |vendor_type| [ vendor_type.vendor_type, vendor_type.id ] }
    #@cities = City.where("state_id = ?", State.first.id)
    #  @cities = City.all.map{ |city| [ city.name, city.id ] }
    #   @cities = @vendor.state.cities.order(:city)
    #  @sectors = current_user.company.branches.collect{|b| b.sector}.uniq
    # @cities = City.all
    #  @states= State.all.map{ |state| [ state.name, state.id ] }
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
    #@cities = City.all.map{ |city| [ city.name, city.id ] }
    #  @cities = City.all
    @states= State.all.map{ |state| [ state.name, state.id ] }
  end
  def index
    @vendors = Vendor.all

  end
  def index2
    params
    city_id = params[:city].to_i
    state_id = params[:state].to_i
    region_id = params[:region].to_i

    @vendors = Vendor.all
    #debugger

    @vendors_to_send=Array.new
    @vendors.each do |vim|
    #  debugger

      if vim.city_id == city_id  and vim.region_id == region_id and vim.state_id == state_id
      #  @vendors_to_send.push(vim)
          @vendors_to_send << { :id => vim.id, :name => vim.name, :address1 =>vim.address1, :address2 =>vim.address2,
                                :region => vim.region.name, :city => vim.city.name, :state => vim.state.name, :ranking => vim.ranking,
                                :vendor_type => vim.vendor_type.vendor_type, :contact_name_1 => vim.contact_name_1,
                              :contact_email_1 => vim.contact_email_1 , :contact_mob_1 => vim.contact_mob_1, :listing_category => vim.listing_category}
      end
    end
    render json: @vendors_to_send
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
