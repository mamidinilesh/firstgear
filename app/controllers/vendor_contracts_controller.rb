class VendorContractsController < ApplicationController
  def new
    @vendor_contract = VendorContract.new
    @vendors = Vendor.all
  end
  def show
    @vendor_contract= VendorContract.find(params[:id])
      @vendors = Vendor.all
  end
  def create
    @vendor_contract = VendorContract.new(vendor_contract_params)
    @vendors = Vendor.all
    respond_to do |format|
      if @vendor_contract.save
        format.html { redirect_to @vendor_contract, vehicle: 'vendor_contract was successfully created.' }
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
      if @vendor_contract.update(vendor_contract_params)
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
        @vendors = Vendor.all
  end
  def index
    @vendor_contracts=VendorContract.all
      @vendors= Vendor.all
  end

private
  def vendor_contract_params
    params.require(:vendor_contract).permit(:vendor_id , :start_date, :end_date, :comments ,:listing_fees ,
    :listing_fees_paid , :active)
  end

  def set_vendor_contract
    @vendor_contract = VendorContract.find(params[:id])
  end
end
