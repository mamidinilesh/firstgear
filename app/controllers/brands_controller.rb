  class BrandsController < ApplicationController
    def new
      @brand = Brand.new
    end
    def show
      @brand = Brand.find(params[:id])
    end

    def index
      @brands = Brand.all
    end

    #to create new brand
    # brand params are defined in private
    def create
      @brand = Brand.new(brand_params)
      respond_to do |format|
        if @brand.save
          format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
          format.json { render :show, status: :created, location: @brand }
        else
          format.html { render :new }
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end



    def update

      respond_to do |format|
          @brand = Brand.find(params[:id])
        if @brand.update(brand_params)
          format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
          format.json { render :show, status: :ok, location: @brand }
        else
          format.html { render :edit }
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

  def edit
      @brand = Brand.find(params[:id])
  end
    private
    def brand_params
      params.require(:brand).permit( :name, :active)
    end

    def set_brand
    @brand = Brand.find(params[:id])
  end
  end
