class CitiesController < ApplicationController
  def new
    @city = City.new
     @states = State.all.map{ |state| [ state.name, state.id ] }

  end
  def show
    @city= City.find(params[:id])

  end
  def create
    @city= City.new(city_params)
    @state = State.find_by(id: city_params[:state_id])

    @states = State.all
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, service: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
        @city = City.find(params[:id])

      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
      @city= City.find(params[:id])
      @states = State.all.map{ |state| [ state.name, state.id ] }
  end
  def index
    @cities= City.all

  end

  private
  def city_params
    params.require(:city).permit(:name , :state_id,  :active)
  end

  def set_city
    @city = City.find(params[:id])
  end
  end
