class VendorTypesController < ApplicationController
  def new
    @vendor_type = VendorType.new
  end
  def show
    @vendor_type = VendorType.find(params[:id])
  end

  def index
    @vendor_types = VendorType.all
  end

  #to create new brand
  # brand params are defined in private
  def create
    @vendor_type = VendorType.new(vendor_type_params)
    respond_to do |format|
      if @vendor_type.save
        format.html { redirect_to @vendor_type, notice: 'Vendor Type was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_type }
      else
        format.html { render :new }
        format.json { render json: @vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
        @vendor_type = VendorType.find(params[:id])
      if @vendor_type.update(vendor_type_params)
        format.html { redirect_to @vendor_type, notice: 'Vendor type was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_type }
      else
        format.html { render :edit }
        format.json { render json: @vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
    @vendor_type = VendorType.find(params[:id])
end
  private
  def vendor_type_params
    params.require(:vendor_type).permit( :vendor_type, :active)
  end

  def set_vendor_type
  @vendor_type = Vendor_type.find(params[:id])
end
end
