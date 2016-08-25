class ServicesController < ApplicationController
  def new
    @service = Service.new
    @categories = Category.all
  end
  def show
    @service= Service.find(params[:id])
      @categories = Category.all
  end
  def create
    @service= Service.new(service_params)
    @category = Category.find_by(id: service_params[:category_id])
    @service.category_id = service_params[:category_id]
    @Category = Category.all
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, service: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
        @service = Service.find(params[:id])

      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
      @service= Service.find(params[:id])
        @categories = Category.all
  end
  def index
    @services= Service.all
      @categories = Category.all
  end

  private
  def service_params
    params.require(:service).permit(:name , :category_id, :default_commission, :active)
  end

  def set_service
    @service = Service.find(params[:id])
  end
  end
