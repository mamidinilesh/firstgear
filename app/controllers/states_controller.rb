class StatesController < ApplicationController
  def new
    @state = State.new
  end
  def show
    @state = State.find(params[:id])
  end

  def index
    @states = State.all
  end

  #to create new brand
  # brand params are defined in private
  def create
    @state = State.new(state_params)
    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
        @state = State.find(params[:id])
      if @state.update(state_params)
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
    @state = State.find(params[:id])
end
  private
  def state_params
    params.require(:state).permit( :name, :active)
  end

  def set_state
  @state = State.find(params[:id])
end
end
