class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  #to create new category
  # category params are defined in private
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end



  def update

    respond_to do |format|
        @category = Category.find(params[:id])
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
    @category = Category.find(params[:id])
end
  private
  def category_params
    params.require(:category).permit( :name, :active)
  end

  def set_category
  @category = Category.find(params[:id])
end
end
